FROM centos:centos5

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com
MAINTAINER Yannis ROSSETTO <yannis.rossetto@enalean.com>

# EPEL
RUN rpm -i http://fr2.rpmfind.net/linux/epel/5/i386/epel-release-5-4.noarch.rpm

COPY Tuleap.repo /etc/yum.repos.d/

RUN yum -y install php \
    php-soap \
    php-mysql \
    php-gd \
    php-xml \
    php-mbstring \
    php-imap \
    mysql-server \
    php-pecl-xdebug \
    git \
    php-zendframework \
    htmlpurifier \
    jpgraph-tuleap \
    php-pear-Mail-mimeDecode \
    rcs \
    cvs \
    php-guzzle \
    php-password-compat \
    unzip \
    tar \
    subversion \
    bzip2 \
    php-pecl-json \
    php-pecl-zip \
    subversion && \
    yum clean all

RUN git config --global user.email "ut@tuleap.org"
RUN git config --global user.name "Unit test runner"

RUN useradd codendiadm

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
