FROM fedora:21

RUN yum install -y rpm-build wget tar make automake gcc gcc-c++ kernel-devel
RUN mkdir -p /BUILDS-RW/
COPY run-builds.sh /BUILDS-RW/run-builds.sh
RUN chmod 755 /BUILDS-RW/run-builds.sh
WORKDIR /BUILDS-RW
ENTRYPOINT ["./run-builds.sh"]
CMD []
