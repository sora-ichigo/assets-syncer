#!/bin/bash

LOG_OUT=./logs/stdout.log

exec &> >(awk '{print strftime("[%Y/%m/%d %H:%M:%S] "),$0 } { fflush() } ' >> $LOG_OUT)

aws s3 sync $AWS_S3_BUCKET_PATH ./images
