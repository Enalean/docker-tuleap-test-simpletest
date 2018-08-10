FROM centos:6

COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/
COPY *.repo /etc/yum.repos.d/

RUN yum install -y epel-release centos-release-scl && \
    yum -y install \
    php72-php \
    php72-php-soap \
    php72-php-mysqlnd \
    php72-php-gd \
    php72-php-process \
    php72-php-xml \
    php72-php-mbstring \
    php72-php-imap \
    php72-php-intl \
    php72-php-pecl-zip \
    php72-php-pecl-xdebug \
    php72-php-pecl-redis \
    mysql-server \
    rcs \
    cvs \
    php-ZendFramework2-Loader \
    php-ZendFramework2-Mail \
    unzip \
    tar \
    subversion \
    bzip2 \
    sudo \
    rh-git29-git \
    gitolite3 && \
    yum clean all

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner" && \
    useradd codendiadm && \
    useradd gitolite && \
    ln -s /usr/share/tuleap/ /tuleap && \
    service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'" && \
    mkdir -p /var/tmp/tuleap_cache && \
    ln -s /var/tmp/codendi_cache /var/tmp/tuleap_cache && \
    echo "Defaults:root    !requiretty" >> /etc/sudoers
