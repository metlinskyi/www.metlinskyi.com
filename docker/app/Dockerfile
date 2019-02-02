FROM nginx:alpine

LABEL maintainer Roman Metlinskyi <gmail@metlinskyi.com>

ARG email
ARG name

RUN apk --update --no-cache add \
	sudo \
	shadow \
	git \
	nodejs \ 
	nodejs-npm

RUN git config --global user.email "$email" 
RUN	git config --global user.name "$name"

RUN npm install -g sass
RUN npm install -g less
RUN npm install -g typescript 
RUN npm install -g grunt-cli
RUN npm install -g webpack
RUN npm install -g @angular/cli
RUN npm install -g create-react-app
RUN npm install -g @vue/cli
RUN npm install -g @vue/cli-service-global
RUN npm install -g ember-cli
RUN npm install -g polymer-cli --unsafe-perm

COPY nginx.conf /etc/nginx/nginx.conf
COPY startup.sh /usr/local/bin/startup.sh

WORKDIR /usr/share/app

CMD [ "sh", "/usr/local/bin/startup.sh" ]