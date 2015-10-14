#!/usr/bin/env bash
SOURCE="/src/dir/here"
DEST="/dest/dir/here"
COUNT=0
MAX_COPY=10
IFS='
'


for file in `find $SOURCE -name '*.wav' -print`
do

  if [ $COUNT -ge $MAX_COPY ]
  then

    echo "Waiting for destination to empty"

    while [ `ls -a $DEST | wc -l` -gt 2 ]
    do
      printf '.'
      sleep 2
    done

    COUNT=0
    printf "\n"

  fi

  echo "Copying file: $file"
  cp "${file}" "${DEST}"
  COUNT=$((COUNT+1))
  echo "${file}" >> copied_files.log

done
