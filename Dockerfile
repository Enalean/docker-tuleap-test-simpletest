## Re-use tuleap base for caching ##
FROM centos:centos6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com

COPY *.repo /etc/yum.repos.d/

RUN yum install -y epel-release && \
    rpm -i http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && \
    yum --enablerepo=remi-php70 install -y \
    php-soap \
    php-mysqlnd \
    php-gd \
    php-process \
    php-xml \
    php-mbstring \
    php-zendframework \
    php-restler \
    htmlpurifier \
    jpgraph-tuleap \
    php-pear-Mail-mimeDecode \
    php-pecl-xdebug \
    php-opcache \
    php-guzzle \
    mysql-server \
    rcs \
    cvs \
    php-guzzle \
    php-password-compat \
    php-ZendFramework2-Loader \
    php-ZendFramework2-Mail \
    unzip \
    tar \
    subversion \
    bzip2 \
    git && \
    php-jwt \
    php-openid-connect-client \
    sudo && \
    yum clean all

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner" && \
    service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

# VOLUME ["/tuleap"]
