#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Please provide a simple text file of links to download."
  exit 1
fi

# check our input textfile exists
if [ ! -f "$1" ]; then
  echo "File $1 does not exist."
  exit 2
fi

for i in $(cat $1); do
  
  # This removes comments (# and everything after on a line)
  LINK=${i%#*}
  
  # don't do anything if this line is empty
  if [ -z "$LINK" ]
  then
    continue
  fi
  
  # download the link on this line
  echo "downloading: $LINK"
  youtube-dl --no-mtime "$LINK"

done


