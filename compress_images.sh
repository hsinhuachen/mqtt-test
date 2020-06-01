#!/bin/sh

cd ./source/imgs

find ./* -type f -name "*.jpeg" -exec jpegoptim -s {} \;
find ./* -type f -name "*.jpg" -exec jpegoptim -s {} \;
find ./* -type f -name "*.png" -exec optipng -strip all {} \;
