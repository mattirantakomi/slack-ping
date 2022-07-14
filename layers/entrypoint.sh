#!/usr/bin/env bash

_term() {
  >&2 echo "TERM (entrypoint.sh)"
  exit 0
}
trap "_term" TERM

while true; do
  set +e
    while true; do 
      date
      echo -n "primary: " ; wget -q -O - https://wss-primary.slack.com | sed -e 's/<[^>]*>//g' ; echo
      echo -n "backup: " ; wget -q -O - https://wss-backup.slack.com | sed -e 's/<[^>]*>//g' ; echo
      echo -n "mobile: " ; wget -q -O - https://wss-mobile.slack.com | sed -e 's/<[^>]*>//g' ; echo
      sleep 5
    done
  set -e
  sleep 1
done