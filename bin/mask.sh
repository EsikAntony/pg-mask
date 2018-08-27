#!/bin/bash -ex
DIR=$(dirname $(dirname "$0"))
pg_dump --host=$1 --port=5432 -U $3 -f pre_data.sql --section=pre-data $2
psql --host=$1 --port=5432 -Abt -f ${DIR}/sql/generate_masks.sql $2 $3
pg_dump --host=$1 --port=5432 -U $3 -f post_data.sql --section=post-data $2
