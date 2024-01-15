#!/usr/bin/env bash
"""
    This command deletes all the directories named __pycache__ recursively in all the subdirectories of the current directory
"""

rm -rf $(find | grep __pycache__ | grep -v *venv*)