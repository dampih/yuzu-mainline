#!/bin/bash -ex

# Copy documentation
cp license.txt "$DIR_NAME"
cp README.md "$DIR_NAME"

tar -cJvf "${REV_NAME}-source.tar.xz" src externals CMakeLists.txt README.md license.txt
cp "${REV_NAME}-source.tar.xz" "$DIR_NAME"

tar $COMPRESSION_FLAGS "$ARCHIVE_NAME" "$DIR_NAME"

mv "$DIR_NAME" TRESS
mv "${REV_NAME}-source.tar.xz" TRESS

7z a "$REV_NAME.7z" TRESS

# move the compiled archive into the artifacts directory to be uploaded by travis releases
mv "$ARCHIVE_NAME" artifacts/
mv "$REV_NAME.7z" artifacts/
