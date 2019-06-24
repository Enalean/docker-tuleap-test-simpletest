FROM centos:6

COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/
COPY *.repo /etc/yum.repos.d/

RUN yum install -y epel-release centos-release-scl && \
    yum -y install \
    php73-php \
    php73-php-soap \
    php73-php-mysqlnd \
    php73-php-gd \
    php73-php-process \
    php73-php-xml \
    php73-php-mbstring \
    php73-php-imap \
    php73-php-intl \
    php73-php-sodium \
    php73-php-ldap \
    php73-php-pecl-zip \
    php73-php-pecl-redis \
    php73-php-pecl-mailparse \
    mysql-server \
    rcs \
    cvs \
    php-guzzle-Guzzle \
    sha1collisiondetector \
    php-mediawiki-tuleap-123 \
    unzip \
    tar \
    subversion \
    bzip2 \
    sudo \
    sclo-git212-git \
    gitolite3 && \
    yum clean all

COPY start-mysqld.sh /usr/local/bin/

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner" && \
    useradd codendiadm && \
    useradd gitolite && \
    ln -s /usr/share/tuleap/ /tuleap && \
    start-mysqld.sh && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'" && \
    mkdir -p /var/tmp/tuleap_cache && \
    ln -s /var/tmp/codendi_cache /var/tmp/tuleap_cache && \
    echo "Defaults:root    !requiretty" >> /etc/sudoers
