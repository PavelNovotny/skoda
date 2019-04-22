#!/bin/bash

indices=$@
echo "$indices"

if [ -z $else_url ]; then
  else_url=http://localhost:9200
fi
if [ -z $authorization ]; then
  authorization=""
fi

for i in $indices
do
  echo "--- processing $i"

  # pro index.batch
  INDEX_NAME=$i

  cmd=$(cat ./index.batch)

  cat ./index.batch | while read line

  do
    read -r -a parts <<< "$line"
    method=${parts[0]}
    end_point=$(eval echo ${parts[1]})
    file=$(eval echo ${parts[2]})
    echo "$method $end_point $file"

    if [ -z $file ]; then
      echo curl --noproxy localhost -H 'Content-Type: application/json' "Authorization: Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk=" -X $method $else_url$end_point
      curl --noproxy localhost -H 'Content-Type: application/json' "Authorization: Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk=" -X $method $else_url$end_point
    else
      echo curl --noproxy localhost -H 'Content-Type: application/json' -H "Authorization: Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk=" -X $method $else_url$end_point --data-binary @$file
      curl --noproxy localhost -H 'Content-Type: application/json' -H "Authorization: Basic c3AxdXN1czNyOmt1ckJ2N1F9I0NkNjk=" -X $method $else_url$end_point --data-binary @$file
    fi

    echo ""
  done
done

