#!/bin/bash
export PATH=/opt/homebrew/bin:$PATH
file=`osascript -e "tell application id \"com.apple.dt.Xcode\"
set CurrentActiveDocument to document 1 whose name ends with (word -1 of (get name of   window 1))
set WhatYouWant to path of CurrentActiveDocument
end tell"`
LOGPATH=$(dirname "$0")
LOGNAME=formatWithClangLog.txt
#echo "Filepath: $file" > ${LOGPATH}/${LOGNAME}
swiftlint lint --path $file --autocorrect --strict --enable-all-rules --format 1>${LOGPATH}/${LOGNAME} 2>&1
