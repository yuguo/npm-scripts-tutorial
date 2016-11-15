#!/bin/bash

read -p "How old are you:" age

if ((age>=16));then
  echo "You can drink"
else
  echo "You can't drink"
fi