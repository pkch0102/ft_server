FROM	debian:buster 

LABEL	maintainer="kicpark@student.42seoul.kr"

ENV AUTOINDEX on

RUN	apt-get update && apt-get install -y \
	nginx \
	mariadb-server \
	php-mysql \
	php-mbstring \
	openssl \
	vim \
	wget \
	php7.3-fpm

COPY	./srcs/run.sh ./
COPY	./srcs/default ./tmp
COPY	./srcs/non_auto_default ./tmp
COPY	./srcs/wp-config.php ./tmp
COPY	./srcs/config.inc.php ./tmp

EXPOSE	80 443

CMD 	bash run.sh
