#!/bin/bash
cd /home/root
mkdir pg-backup
PGPASSWORD="$PG_PASS" pg_dumpall -h $PG_HOST -p $PG_PORT -U $PG_USER > pg-backup/postgres-db.tar
file_name="pg-backup.tar.gz"

#Compressing backup file for upload
tar -zcvf $file_name pg-backup
filesize=$(stat -c %s $file_name)
mfs=10

if [[ "$filesize" -gt "$mfs" ]]; then
# Uploading to s3
aws s3 cp pg-backup.tar.gz $S3_BUCKET
fi
