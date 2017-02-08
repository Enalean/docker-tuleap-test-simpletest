## Re-use tuleap base for caching ##
FROM centos:centos6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com
MAINTAINER Yannis ROSSETTO <yannis.rossetto@enalean.com>

COPY *.repo /etc/yum.repos.d/

RUN yum install -y epel-release && \
    yum -y install php \
    php-pecl-xdebug \
    php-soap \
    php-mysql \
    php-gd \
    php-process \
    php-xml \
    php-mbstring \
    php-imap \
    php-restler \
    mysql-server \
    php-zendframework \
    htmlpurifier \
    jpgraph-tuleap \
    php-pear-Mail-mimeDecode \
    rcs \
    cvs \
    php-guzzle \
    php-guzzle-Guzzle \
    php-password-compat \
    php-paragonie-random-compat \
    php-ZendFramework2-Loader \
    php-ZendFramework2-Mail \
    unzip \
    tar \
    subversion \
    bzip2 \
    php-pecl-xdebug \
    git \
    git19 \
    php-markdown \
    php-jwt \
    php-openid-connect-client \
    php-mediawiki-tuleap \
    sudo && \
    yum clean all

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner"

RUN useradd codendiadm
RUN useradd gitolite

RUN ln -s /usr/share/tuleap/ /tuleap

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
