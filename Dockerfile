## Re-use tuleap base for caching ##
FROM centos:centos6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com
MAINTAINER Yannis ROSSETTO <yannis.rossetto@enalean.com>

RUN rpm -i http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && \
    rpm -i http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && \
    rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt && \
    rpm -i http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

# Uncomment when EPEL start shitting bricks (like 404)
# RUN sed -i 's/#baseurl/baseurl/' /etc/yum.repos.d/epel.repo
# RUN sed -i 's/mirrorlist/#mirrorlist/' /etc/yum.repos.d/epel.repo

COPY *.repo /etc/yum.repos.d/

RUN yum -y install --enablerepo=remi --enablerepo=rpmforge-extras \
    php \
    php-soap \
    php-mysql \
    php-gd \
    php-process \
    php-xml \
    php-mbstring \
    php-imap \
    php-restler \
    php-pecl-apc \
    php-pecl-xdebug \
    mysql-server \
    git \
    php-zendframework \
    htmlpurifier \
    jpgraph-tuleap \
    php-pear-Mail-mimeDecode \
    rcs \
    cvs \
    php-guzzle \
    php-ZendFramework2-Loader \
    php-ZendFramework2-Mail \
    unzip \
    tar \
    subversion \
    php-markdown \
    bzip2 \
    php-jwt \
    php-openid-connect-client \
    php-mediawiki-tuleap \
    sudo && \
    yum clean all

RUN yum install -y php-password-compat && yum clean all

RUN git config --global user.email "ut@tuleap.org" && git config --global user.name "Unit test runner"

RUN useradd codendiadm
RUN useradd gitolite

RUN ln -s /usr/share/tuleap/ /tuleap

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

COPY run.sh /run.sh
ENTRYPOINT ["/run.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
