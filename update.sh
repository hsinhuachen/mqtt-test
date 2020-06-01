#!/bin/sh
#TARGET_DIR='./build/'

git pull origin master
bundle
#./compress_images.sh
bundle exec middleman build
#rsync -av --delete ./pdf/ $TARGET_DIR/pdf/

#cd build; ln -s ./index.html

sudo systemctl reload nginx