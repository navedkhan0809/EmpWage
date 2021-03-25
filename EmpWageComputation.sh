#!/bin/bash -x

empCheck=$((RANDOM%2))
isPresent=1

if [ $empCheck -eq $isPresent ]
then
   echo "Employee is Present"
else
   echo "Employee is absent"
fi
