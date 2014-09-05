FROM centos:centos5

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com

# EPEL
RUN rpm -i http://fr2.rpmfind.net/linux/epel/5/i386/epel-release-5-4.noarch.rpm

ADD Tuleap.repo /etc/yum.repos.d/

# Update to last version
RUN yum -y update; yum clean all

RUN yum -y install php && yum clean all
RUN yum -y install php-soap && yum clean all
RUN yum -y install php-mysql && yum clean all
RUN yum -y install php-gd && yum clean all
RUN yum -y install php-xml && yum clean all
RUN yum -y install php-mbstring && yum clean all
RUN yum -y install mysql-server && yum clean all

RUN yum -y install php-pecl-xdebug && yum clean all

RUN yum -y install git && yum clean all

RUN yum -y install php-zendframework && yum clean all
RUN yum -y install htmlpurifier && yum clean all
RUN yum -y install jpgraph-tuleap && yum clean all
RUN yum -y install php-pear-Mail-mimeDecode && yum clean all
RUN yum -y install rcs && yum clean all
RUN yum -y install cvs && yum clean all
RUN yum -y install php-guzzle && yum clean all
RUN yum -y install php-password-compat && yum clean all

## ADDED
RUN yum -y install unzip && yum clean all
RUN yum -y install tar && yum clean all
RUN yum -y install subversion && yum clean all
RUN yum -y install bzip2 && yum clean all

RUN git config --global user.email "ut@tuleap.org"
RUN git config --global user.name "Unit test runner"

RUN yum -y install php-pecl-json && yum clean all

RUN yum -y install subversion && yum clean all

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

RUN git config --global user.email "ut@tuleap.org"
RUN git config --global user.name "Unit test runner"

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
