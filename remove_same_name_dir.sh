#!/usr/bin/env bash

"""
    This command deletes all the files/directories named __pycache__ recursively in all the subdirectories of the current directory, ignoring any files that contains 'venv' in its name.
"""

rm -rf $(find | grep __pycache__ | grep -v *venv*)
