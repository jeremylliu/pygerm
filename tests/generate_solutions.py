import os
import subprocess
import shutil

SOL_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'sol', "core"))
TESTCASES_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'testcases', "core"))
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))

if __name__ == "__main__":
    # Compile the game engine
    p = subprocess.Popen(["make"], cwd=ROOT_DIR, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

    my_env = os.environ.copy()
    my_env["AUTOGRADER"] = "True"

    testcases = os.listdir(TESTCASES_DIR)
    testcases.sort()
    for filename in testcases:
        print(f"Running test {filename}...")
        test_dir = os.path.abspath(os.path.join(TESTCASES_DIR, filename))

        # open a file in the directory for output and error
        output_file = os.path.join(test_dir, "output.txt")
        error_file = os.path.join(test_dir, "error.txt")
        with open(output_file, "w") as output, open(error_file, "w") as error:
            # run the game engine
            p = subprocess.Popen(["../../../../game_engine_linux"], cwd=test_dir, env=my_env, stdout=output, stderr=error, shell=True)
            p.wait(timeout=20)

        # create a new directory in sol_dir
        sol_dir = os.path.join(SOL_DIR, filename)
        os.makedirs(sol_dir, exist_ok=True)

        # move the output and error files to the new directory and delete them out of the old place
        os.rename(output_file, os.path.join(sol_dir, "output.txt"))
        os.rename(error_file, os.path.join(sol_dir, "error.txt"))

        frames_src = os.path.abspath(os.path.join(test_dir, "frames"))
        frames_dst = os.path.abspath(os.path.join(sol_dir, "frames"))

        if os.path.exists(frames_dst):
            shutil.rmtree(frames_dst)

        os.makedirs(frames_src, exist_ok=True)
        shutil.copytree(frames_src, frames_dst)
        if os.path.exists(frames_src):
            shutil.rmtree(frames_src)