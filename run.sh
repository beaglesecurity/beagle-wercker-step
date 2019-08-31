#!/bin/bash
URL=https://api.beaglesecurity.com/v1/test/start
curl --silent --header "Content-Type: application/json" --request POST --data "{\"access_token\":\"$ACCESS_TOKEN\",\"application_token\":\"$APPLICATION_TOKEN\"}" $URL | \
    sed -e 's/[{}]/''/g' | awk 'BEGIN { FS="\""; RS="," }; { if ($2 == "status") { print "Status : "$4} if ($2 == "message") { print "Message : "$4} }'
