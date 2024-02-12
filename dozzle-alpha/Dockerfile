FROM amir20/dozzle:latest

RUN apk add --no-cache bash

COPY run.sh /

RUN chmod +ax /run.sh

CMD ["/run.sh"]