FROM nginx:alpine

LABEL maintainer Roman Metlinskyi <gmail@metlinskyi.com>

RUN apk --update --no-cache add \
	sudo \
	shadow 

COPY startup.sh /usr/local/bin/startup.sh

WORKDIR /usr/share/app

CMD [ "sh", "/usr/local/bin/startup.sh" ]