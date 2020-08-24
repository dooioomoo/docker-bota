ARG CENTOS_VERSION
FROM centos:${CENTOS_VERSION}
LABEL maintainer="ryan <dooioomoo@gmail.com>"

RUN groupadd -f www && useradd -g www www


# install pkg
RUN yum install -y wget \
	&& yum install -y ca-certificates \
	&& yum install -y openssh-server sudo \
	&& yum install -y gd gcc-c++ libtirpc


COPY ./docker-entrypoint.sh /entrypoint.sh


ARG BAOTA_INSTALL_PATH
ARG BAOTA_USERNAME
ARG BAOTA_PASSWORD
ARG DNS1
ARG DNS2

ENV BAOTA_INSTALL_PATH $BAOTA_INSTALL_PATH
ENV BAOTA_USERNAME $BAOTA_USERNAME
ENV BAOTA_PASSWORD $BAOTA_PASSWORD
ENV DNS1 $DNS1
ENV DNS2 $DNS2

RUN chmod +x /entrypoint.sh && sed -i "s/\r//" /entrypoint.sh \
	&& sed -i "s|SETSOURCE=\$1|SETSOURCE=$BAOTA_INSTALL_PATH|" /entrypoint.sh \
	&& sed -i "s|BOTAUSERNAME=\$2|BOTAUSERNAME=$BAOTA_USERNAME|" /entrypoint.sh \
	&& sed -i "s|BOTAPASSWORD=\$3|BOTAPASSWORD=$BAOTA_PASSWORD|" /entrypoint.sh \
	&& sed -i "s|DNS1=8.8.8.8|DNS1=$DNS1|" /entrypoint.sh \
	&& sed -i "s|DNS2=8.8.4.4|DNS2=$DNS2|" /entrypoint.sh

#ENTRYPOINT /entrypoint.sh $BAOTA_INSTALL_PATH $BAOTA_USERNAME $BAOTA_PASSWORD

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/init"]
