FROM centos:6

RUN yum install -y rpm-build wget tar
RUN mkdir -p /BUILDS-RW/
COPY run-builds.sh /BUILDS-RW/run-builds.sh
RUN chmod 755 /BUILDS-RW/run-builds.sh
