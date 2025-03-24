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
      echo -n "primary: " ; curl --connect-timeout 10 -s -w "\nConnect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" https://wss-primary.slack.com | sed -e 's/<[^>]*>//g' ; echo
      echo -n "backup: " ; curl --connect-timeout 10 -s -w "\nConnect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" https://wss-backup.slack.com | sed -e 's/<[^>]*>//g' ; echo
      echo -n "mobile: " ; curl --connect-timeout 10 -s -w "\nConnect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" https://wss-mobile.slack.com | sed -e 's/<[^>]*>//g' ; echo "---"
      sleep 5
    done
  set -e
  sleep 1
done