#!/bin/bash -ex
DIR=$(dirname $(dirname "$0"))
dropdb --host=$1 --port=5432 -U $3 -W --if-exists -i $2
createdb --host=$1 --port=5432 -U $3 -O $3 $2
psql --host=$1 --port=5432 -U $3 -q $2 $3 <<EOF
\i pre_data.sql
\i masked_data.sql
\i post_data.sql
EOF
