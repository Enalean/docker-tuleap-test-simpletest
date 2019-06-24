FROM centos:7

COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/
COPY *.repo /etc/yum.repos.d/

RUN yum install -y epel-release centos-release-scl && \
    yum -y install \
    php74-php \
    php74-php-soap \
    php74-php-mysqlnd \
    php74-php-gd \
    php74-php-process \
    php74-php-xml \
    php74-php-mbstring \
    php74-php-imap \
    php74-php-intl \
    php74-php-sodium \
    php74-php-ldap \
    php74-php-pecl-zip \
    php74-php-pecl-redis \
    php74-php-pecl-mailparse \
    rh-mysql57-mysql-server \
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

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner" && \
    useradd codendiadm && \
    useradd gitolite && \
    ln -s /usr/share/tuleap/ /tuleap && \
    sudo -u mysql /usr/bin/scl enable rh-mysql57 -- /opt/rh/rh-mysql57/root/usr/libexec/mysql-prepare-db-dir rh-mysql57-mysqld && \
    sudo -u mysql /opt/rh/rh-mysql57/root/usr/libexec/mysqld-scl-helper enable rh-mysql57 -- /opt/rh/rh-mysql57/root/usr/libexec/mysqld --daemonize --basedir=/opt/rh/rh-mysql57/root/usr --pid-file=/var/run/rh-mysql57-mysqld/mysqld.pid && \
    sleep 1 && /usr/bin/scl enable rh-mysql57 -- mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'" && \
    mkdir -p /var/tmp/tuleap_cache && \
    echo "Defaults:root    !requiretty" >> /etc/sudoers
