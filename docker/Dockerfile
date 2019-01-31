FROM nginx:alpine

LABEL maintainer Roman Metlinskyi <gmail@metlinskyi.com>

RUN apk --update --no-cache add \
	shadow \
	git \
	nodejs \ 
	nodejs-npm

RUN npm install -g grunt-cli
RUN npm install -g webpack
RUN npm install -g typescript 
RUN npm install -g @angular/cli
RUN npm install -g polymer-cli --unsafe-perm
RUN npm install -g sass

COPY nginx.conf /etc/nginx/nginx.conf
COPY startup.sh /usr/local/bin/startup.sh

WORKDIR /usr/share/nginx/html

CMD [ "sh", "/usr/local/bin/startup.sh" ]