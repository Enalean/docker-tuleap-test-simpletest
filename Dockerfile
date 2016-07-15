## Re-use tuleap base for caching ##
FROM centos:centos6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com
MAINTAINER Yannis ROSSETTO <yannis.rossetto@enalean.com>

RUN yum install -y epel-release rpmforge-release centos-release-scl && \
    rpm -i http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

COPY *.repo /etc/yum.repos.d/

RUN yum -y install  \
    rh-php56-php \
    rh-php56-php-soap \
    rh-php56-php-mysqlnd \
    rh-php56-php-gd \
    rh-php56-php-process \
    rh-php56-php-xml \
    rh-php56-php-mbstring \
    rh-php56-php-imap \
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
    php-markdown \
    php-jwt \
    php-openid-connect-client \
    php-mediawiki-tuleap \
    sudo && \
    yum install --enablerepo=rpmforge-extras -y git && \
    yum clean all

RUN yum install -y php-password-compat && yum clean all

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner"

RUN useradd codendiadm
RUN useradd gitolite

RUN ln -s /usr/share/tuleap/ /tuleap

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

COPY run.sh /run.sh
COPY run-with-php56.sh /run-with-php56.sh

ENTRYPOINT ["/run-with-php56.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
