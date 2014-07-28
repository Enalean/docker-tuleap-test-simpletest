## Re-use tuleap base for caching ##
FROM enalean/docker-tuleap-base:1.0

MAINTAINER Manuel Vacelet, manuel.vacelet@enalean.com

RUN yum -y install php && yum clean all
RUN yum -y install php-soap && yum clean all
RUN yum -y install php-mysql && yum clean all
RUN yum -y install php-gd && yum clean all
RUN yum -y install php-process && yum clean all
RUN yum -y install php-xml && yum clean all
RUN yum -y install php-pecl-xdebug  && yum clean all
RUN yum -y install php-mbstring && yum clean all
RUN yum -y install mysql-server && yum clean all
RUN yum -y install httpd && yum clean all

ADD Tuleap.repo /etc/yum.repos.d/
RUN yum -y install php-password-compat && yum clean all
RUN yum -y install php-zendframework && yum clean all
RUN yum -y install htmlpurifier && yum clean all
RUN yum -y install jpgraph-tuleap && yum clean all
RUN yum -y install php-restler

RUN service mysqld start && sleep 1 && mysql -e "GRANT ALL PRIVILEGES on *.* to 'integration_test'@'localhost' identified by 'welcome0'"

RUN curl -k -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin

ADD rest-tests.conf /etc/httpd/conf.d/rest-tests.conf

ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]

VOLUME ["/tuleap"]
VOLUME ["/output"]
