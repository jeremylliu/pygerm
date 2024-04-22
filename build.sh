source ./venv/bin/activate
python setup.py bdist_wheel
pip3 install --force-reinstall ./dist/pygerm-0.0.2-cp311-cp311-macosx_14_0_universal2.whl
deactivate