#!/bin/bash

for i in less/*.less
do
  f=${i##*/}
  ./node_modules/less/bin/lessc $i public/npmcss/${f%%.*}.css
break
done