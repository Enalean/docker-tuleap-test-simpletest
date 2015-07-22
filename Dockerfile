## Re-use tuleap base for caching ##
FROM centos:centos6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com

RUN yum install -y epel-release && \
    rpm -i http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

COPY *.repo /etc/yum.repos.d/

# Uncomment when EPEL start shitting bricks (like 404)
# RUN sed -i 's/#baseurl/baseurl/' /etc/yum.repos.d/epel.repo
# RUN sed -i 's/mirrorlist/#mirrorlist/' /etc/yum.repos.d/epel.repo

RUN yum --enablerepo=remi,remi-test install -y \
    php70
    # php-soap \
    # php-mysql \
    # php-gd \
    # php-process \
    # php-xml \
    # php-mbstring \
    # php-restler \
    # mysql-server \
    # php-zendframework \
    # htmlpurifier \
    # jpgraph-tuleap \
    # php-pear-Mail-mimeDecode \
    # rcs \
    # cvs \
    # php-guzzle \
    # unzip \
    # tar \
    # subversion \
    # bzip2 \
    # php-pecl-xdebug \
    # php-opcache \
    # git && \
    # yum clean all

# RUN yum install -y php-password-compat && yum clean all

# RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner"

# RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

# COPY run.sh /run.sh
# ENTRYPOINT ["/run.sh"]

# CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

# VOLUME ["/tuleap"]
