#!/usr/bin/env bash

declare text=$(find ~)

# Gets all the lines that contains the word ".nvm" and words that contains ".nvm" inside them
echo ${text} | grep .nvm

# Gets all the lines that don't contains the word ".nvm" and words that don't contains ".nvm" inside them
echo ${text} | grep -v .nvm

# Gets all the lines that contains the word ".nvm", it does not show: lines with words that CONTAINS the word ".nvm" and lines without the word ".nvm"
echo ${text} | grep -w .nvm
