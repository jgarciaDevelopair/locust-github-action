#!/bin/sh

if [ -z "$INPUT_LOCUSTFILE" ]
then
    file="/locustfile.py"
else
    file="/github/workspace/$INPUT_LOCUSTFILE"
fi

locust -f $file--headless -u $INPUT_USERS-r $INPUT_RATE--run-time $INPUT_RUNTIME-H $INPUT_URL --csv="$2_$(date +%F_%T)"
for filename in *.csv; do
    [ -e "$filename" ] || continue
    #Upload to S3
    s3 cp "$filename" "S3_BUCKET/"
done
