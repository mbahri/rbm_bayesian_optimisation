#!/bin/bash

# Wrapper script to run the Matlab testRBM function with given parameters
# Usage:
#    - $1 is number of hidden units
#    - $2 is learning rate
#    - $3 is batch size
#    - $4 is number of epochs
#    - $4 is momentum
#    - $4 is decay weight

#echo "$@"
# We discard the first 6 command line arguments
shift; shift; shift; shift; shift;
#echo "$@"
#echo "$2"
#echo "$4"
#echo "$6"
#echo "$8"

ERROR=`matlab -nodisplay -nosplash -r "testRBM(${12}, $8, $2, $6, ${10}, $4)" | grep -oE "[0-9]{2}\.[0-9]+"`

echo "Result of algorithm run: SUCCESS, 0, 0, ${ERROR}, 0"
