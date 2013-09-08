#!/bin/bash

# remove current _site folder and local production folder
rm -v -rf ./_site
rm -v -rf ../yizeng.me-gh-pages/*

# re-build jekyll to create _site
jekyll build

# copy the new _site to local production folder
cp -v -rf ./_site/* ../yizeng.me-gh-pages/

# compress html in _site
for file in $(find ../yizeng.me-gh-pages/ -name '*.html');
	do java -jar ./tools/htmlcompressor-1.5.3.jar --recursive --compress-js -o $file $file;
	echo "Compressing $file..."
done