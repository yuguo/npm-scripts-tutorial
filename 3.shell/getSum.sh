#!/bin/bash

function getSum(){
  local num4=$1
  local num5=$2
  local sum=$((num4+num5))
  echo $sum
}

num1=5
num2=6
num3=$(getSum num1 num2)
echo "$num3"