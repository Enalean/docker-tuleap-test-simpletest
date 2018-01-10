## Re-use tuleap base for caching ##
FROM centos:6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com
MAINTAINER Yannis ROSSETTO <yannis.rossetto@enalean.com>

COPY *.repo /etc/yum.repos.d/

RUN yum install -y epel-release centos-release-scl && \
    yum -y install \
    rh-php56-php \
    rh-php56-php-soap \
    rh-php56-php-mysqlnd \
    rh-php56-php-gd \
    rh-php56-php-process \
    rh-php56-php-xml \
    rh-php56-php-mbstring \
    rh-php56-php-imap \
    rh-php56-php-intl \
    rh-php56-php-pecl-xdebug \
    sclo-php56-php-pecl-redis \
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
    sha1collisiondetector \
    bzip2 \
    php-pecl-xdebug \
    php-markdown \
    php-jwt \
    php-openid-connect-client \
    php-password-compat \
    php-mediawiki-tuleap \
    sudo \
    git \
    git19 \
    rh-git29-git && \
    yum clean all

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner"

RUN useradd codendiadm || echo 'codendiadm user already exist'
RUN useradd gitolite || echo 'gitolite user already exist'

RUN ln -s /usr/share/tuleap/ /tuleap

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

COPY run.sh /run.sh
COPY run-with-php56.sh /run-with-php56.sh

ENTRYPOINT ["/run-with-php56.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
