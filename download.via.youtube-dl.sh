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
  LINK=${i%#*}
  #echo $i
  #echo "--> $LINK "
  if [ -z "$LINK" ]
  then
    continue
  fi
  echo "downloading: $LINK"
  #youtube-dl --no-mtime "$LINK"
done


