#!/bin/bash

LOG_OUT=./logs/stdout.log

exec &> >(awk '{print strftime("[%Y/%m/%d %H:%M:%S] "),$0 } { fflush() } ' >> $LOG_OUT)

aws s3 sync ./images s3://igsr5-images --delete