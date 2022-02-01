#!/usr/bin/env bash
export TOKEN="7oAArDQ2tzSSyirzRj2GPPSTDTHQCWz8"
curl \
  --header "Authorization: Bearer $TOKEN" \
  -kv \
  --request POST \
  --data @payload.json \
  --output backup.blob \
  https://192.168.56.33.nip.io/_backup/api/v1/backup
