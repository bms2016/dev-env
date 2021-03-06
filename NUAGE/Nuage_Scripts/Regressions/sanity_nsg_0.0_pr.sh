#!/bin/bash

help=$1

if [ "$help" == "--help" ]
then
    printf "\nsanity_0.0.sh <tesbed> <pause_msg> <repeat_count> <vca pr number>\n"
    exit
fi

printf "\nQueueing PR %d sanity run %d times...\n" $4 $3

#Queue PR 0.0 Sanity for repeat count specified.
for ((i=1;i<=$3;i+=1))
do
regress -testbed $1 -vsdMode standalone -physTopology nsg -platform dctor -priority P1 -runLevel regular -forcePause $2 -vrs 0.0/PR$4 -altimages 7750/0.0/latest 7750/0.0/latest -runSuite Sanity -useimages 0.0/latest
done
