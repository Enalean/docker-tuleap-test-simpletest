## Re-use tuleap base for caching ##
FROM centos:centos6

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com

# Update to last version
RUN yum -y update; yum clean all

RUN yum -y install php && yum clean all
RUN yum -y install php-soap && yum clean all
RUN yum -y install php-mysql && yum clean all
RUN yum -y install php-gd && yum clean all
RUN yum -y install php-process && yum clean all
RUN yum -y install php-xml && yum clean all
RUN yum -y install php-mbstring && yum clean all
RUN yum -y install mysql-server && yum clean all

# EPEL
RUN rpm -i http://mir01.syntis.net/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum -y install php-pecl-xdebug && yum clean all

# Repoforge
RUN rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
RUN rpm -i http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
ADD rpmforge.repo /etc/yum.repos.d/
RUN yum -y install --enablerepo=rpmforge-extras git && yum clean all

ADD Tuleap.repo /etc/yum.repos.d/
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

RUN git config --global user.email "ut@tuleap.org"
RUN git config --global user.name "Unit test runner"

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]

CMD ["-x", "/tuleap/tests/simpletest", "/tuleap/plugins", "/tuleap/tests/integration"]

VOLUME ["/tuleap"]
VOLUME ["/output"]
