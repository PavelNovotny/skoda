#!/bin/bash
# Restore index and data from a file

import_analyzer() {
cat $3/$1_analyzer.json | jq 'tojson' \
| ./node_modules/elasticdump/bin/elasticdump \
  --input=$ \
  --output=$2  \
  --type=analyzer
}

import_mapping() {
#v pripade, ze se pridava field, tak se mapping zmeni, pokud jakekoliv field menime, jen nutné znovuvytvorit index
cat $3/$1_mapping.json | jq -c '.' \
| ./node_modules/elasticdump/bin/elasticdump \
  --input=$ \
  --output=$2  \
  --type=mapping
}

import_data() {
./node_modules/elasticdump/bin/elasticdump \
  --input=$3/$1_data.json \
  --output=$2  \
  --type=data \
  --limit=1000 \
  --parallel 10
}

import_settings() {
 import_analyzer $1 $2 $3
 import_mapping $1 $2 $3
}

import_all() {
 import_settings $1 $2 $3
 import_data $1 $2 $3
}

