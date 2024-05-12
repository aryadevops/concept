#!/bin/bash

PERSON1=$1
PERSON2=$2
DATE=$(date)

cat "$PERSON1 : hi $PERSON2 how are you"
cat "$PERSON2 : hi $ERSON1 Im good ,what about u"
cat "$PERSON1 : Im good $PERSON2,How u doing"
cat "$PERSON2 : Nothing $PERSON1"
cat " Today date is : $DATE"