#!/bin/bash

logfile=./output.txt
i=200

while [ $i -gt 0 ]
do
 echo $i > $logfile
 i=$[${i}-1]
 sleep 12
done
