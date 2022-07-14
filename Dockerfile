FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl wget screen dnsutils iputils-ping traceroute nano net-tools

COPY layers/ /

ENTRYPOINT ["/entrypoint.sh"]
