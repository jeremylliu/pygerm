#!/usr/bin/env python3

import os
import sys
import getopt
import shutil
import subprocess
import filecmp
import difflib
import cv2
import numpy as np

testcase_description = {
    "core": {
        "0": "Component Loading, OnStart, and the Debug Scripting API",
        "1": "Component Properties, Overrides, and Inheritance",
        "2": "Flexible Referencing",
        "3": "OnUpdate(), OnLateUpdate(), and Lua Errors",
        "4": "Application Scripting API",
        "5": "Input Scripting API",
        "6": "Runtime Component and Actor Manipulation",
        "7": "Text Scripting API",
        "8": "Audio Scripting API",
        "9": "Image Scripting API",
        "a": "Camera Scripting API",
        "b": "Scene Table",
        "c": "Integration and Performance Tests"
    },
}

ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
TESTCASES_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'testcases'))
WORKING_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'tmp'))
SOL_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'sol'))
def main(argv):
    test_suite = "core"
    test_cases = "all"

    # parse command line options:
    try:
        opts, args = getopt.getopt(argv,"s:c:",["suite=, case="])
    except getopt.GetoptError:
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-s", "--suite"):
            test_suite = arg
            if test_suite not in ("core", "physics"):
                print("Invalid test suite: " + test_suite)
                sys.exit(2)
        if opt in ("-c", "--case"):
            test_cases = arg

            if test_cases not in ["all", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c"]:
                print("Invalid test case: " + test_cases)
                sys.exit(2)

    p = subprocess.Popen(["make"], cwd=ROOT_DIR, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    p.wait(timeout=120)
    print(f"Running test suite: \033[96m{test_suite}\033[0m on test cases: \033[96m{test_cases}\033[0m")

    testcases = os.listdir(os.path.abspath(os.path.join(TESTCASES_DIR, test_suite)))
    if test_cases != "all":
        testcases = [x for x in testcases if x.startswith(test_cases)]
    testcases.sort()

    os.makedirs(WORKING_DIR, exist_ok=True)
    my_env = os.environ.copy()
    my_env["AUTOGRADER"] = "True"

    for test in testcases:
        print("Running test: " + test)

        test_dir = os.path.abspath(os.path.join(TESTCASES_DIR, test_suite, test))

        # run testcase
        output_file = os.path.join(test_dir, "output.txt")
        error_file = os.path.join(test_dir, "error.txt")
        with open(output_file, "w") as output, open(error_file, "w") as error:
            # run the game engine
            p = subprocess.Popen(["../../../../game_engine_linux"], cwd=test_dir, env=my_env, stdout=output, stderr=error, shell=True)
            p.wait(timeout=20)

            os.rename(output_file, os.path.join(WORKING_DIR, "output.txt"))
            os.rename(error_file, os.path.join(WORKING_DIR, "error.txt"))

            frames_src = os.path.abspath(os.path.join(test_dir, "frames"))
            frames_dst = os.path.abspath(os.path.join(WORKING_DIR, "frames"))

            if os.path.exists(frames_dst):
                shutil.rmtree(frames_dst)

            os.makedirs(frames_src, exist_ok=True)
            shutil.copytree(frames_src, frames_dst)
            if os.path.exists(frames_src):
                shutil.rmtree(frames_src)

        # compare the output
        expected_output_file = os.path.join(SOL_DIR, test_suite, test, "output.txt")
        actual_output_file = os.path.join(WORKING_DIR, "output.txt")

        if not filecmp.cmp(expected_output_file, actual_output_file):
            print (f"Test {test} failed with incorrect output")
            with open(expected_output_file, 'r') as expected, open(actual_output_file, 'r') as actual:
                diff = difflib.unified_diff(expected.readlines(), actual.readlines(), fromfile='expected', tofile='actual')
                for line in diff:
                    print(line, end='')
            exit(0)

        # compare the error
        expected_error_file = os.path.join(SOL_DIR, test_suite, test, "error.txt")
        actual_error_file = os.path.join(WORKING_DIR, "error.txt")
        if not filecmp.cmp(expected_error_file, actual_error_file):
            print (f"Test {test} failed with incorrect error")
            with open(expected_error_file, 'r') as expected, open(actual_error_file, 'r') as actual:
                diff = difflib.unified_diff(expected.readlines(), actual.readlines(), fromfile='expected', tofile='actual')
                for line in diff:
                    print(line, end='')
            exit(0)

        # compare the frames
        expected_frames_dir = os.path.abspath(os.path.join(SOL_DIR, test_suite, test, "frames"))
        expected_frames = os.listdir(expected_frames_dir)
        expected_frames.sort()

        actual_frames_dir = os.path.abspath(os.path.join(WORKING_DIR, "frames"))
        actual_frames = os.listdir(actual_frames_dir)
        actual_frames.sort()

        for i, (expected_frame, actual_frame) in enumerate(zip(expected_frames, actual_frames)):
            expected_frame_path = os.path.join(expected_frames_dir, expected_frame)
            actual_frame_path = os.path.join(actual_frames_dir, actual_frame)

            expected_frame_img = cv2.imread(expected_frame_path)
            actual_frame_img = cv2.imread(actual_frame_path)

            if not np.array_equal(expected_frame_img, actual_frame_img):
                print (f"Test {test} failed with incorrect frame {i}")

                diff = cv2.absdiff(expected_frame_img, actual_frame_img)

                # Create a mask where differences exist
                mask = cv2.cvtColor(diff, cv2.COLOR_BGR2GRAY)
                _, mask = cv2.threshold(mask, 1, 255, cv2.THRESH_BINARY)

                # Set the differing pixels to pink color (BGR format)
                diff[mask != 0] = [255, 0, 255]  # Pink color

                exp = cv2.copyMakeBorder(expected_frame_img, 0, 0, 0, 25, cv2.BORDER_CONSTANT, value=[255, 255, 255])
                actual = cv2.copyMakeBorder(actual_frame_img, 0, 0,  0, 25, cv2.BORDER_CONSTANT, value=[255, 255, 255])

                combined = np.concatenate((exp, actual, diff), axis=1)

                if os.path.exists(WORKING_DIR):
                    shutil.rmtree(WORKING_DIR)

                cv2.imshow("Expected vs Actual", combined)
                cv2.waitKey(0)
                exit(0)
        # https://testdriven.io/tips/43480c4e-72db-4728-8afd-0b0f4f42d4f4/

        print(f"Test {test} passed")

    if os.path.exists(WORKING_DIR):
        shutil.rmtree(WORKING_DIR)

    print("All tests passed")

if __name__ == "__main__":
    main(sys.argv[1:])
