#!/bin/bash

LOG_OUT=./logs/stdout.log

exec &> >(awk '{ $0 } { fflush() } ' >> $LOG_OUT)

aws s3 sync ./images $AWS_S3_BUCKET_PATH --delete
