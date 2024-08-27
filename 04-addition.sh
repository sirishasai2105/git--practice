#! /bin/bash

echo "ENTER FIRST NUMBER"

read first_number

echo "ENTER SECOND NUMBER"

read second_number

sum= $(( $first_number+ $second_number))

echo "The sum of $first_number and $second_number is:: $sum"