#! /bin/bash

echo "enter a number"

read number

if [ $number -gt 20 ]
then
    echo "entered number $number is greater than 20"
else
    echo "entered number $number is less than 20"