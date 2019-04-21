#!/bin/bash
# Backup index and data to a file

export_mapping() {
./node_modules/elasticdump/bin/elasticdump \
  --headers='{"User-Agent": "elasticdump","Authorization":"Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk="}' \
  --input=$1 \
  --input-index=$2 \
  --output=$ \
  --type=mapping | jq '.' > $3/$2_mapping.json
}

export_analyzer() {
./node_modules/elasticdump/bin/elasticdump \
  --headers='{"User-Agent": "elasticdump","Authorization":"Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk="}' \
  --input=$1 \
  --input-index=$2 \
  --output=$ \
  --type=analyzer | jq 'fromjson' > $3/$2_analyzer.json
}

export_data() { # server index local_folder data_size transform_function
#default size pro všechno je -1
rm $3/$2_data.json
./node_modules/elasticdump/bin/elasticdump \
  --headers='{"User-Agent": "elasticdump","Authorization":"Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk="}' \
  --input=$1 \
  --input-index=$2 \
  --output=$3/$2_data.json \
  --type=data \
  --size=$4 \
  --transform=$5 \
  --limit=10000
}

export_settings() {
export_mapping $1 $2 $3
export_analyzer $1 $2 $3
}

export_all() {
export_settings $1 $2 $3
export_data $1 $2 $3 $4 $5
}

