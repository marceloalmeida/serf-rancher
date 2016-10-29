FROM alpine:edge
MAINTAINER Marcelo Almeida <marcelo.almeida@jumia.com>

ADD \
  etc/ /etc \
  start_serf_agent.sh /root/

CMD sh /root/start_serf_agent.sh
