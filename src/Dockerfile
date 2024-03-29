FROM centos:8

COPY system/ /

RUN yum -y update \
    && yum -y install sudo \
                      tree dos2unix \
                      yum-utils wget tar unzip git mercurial subversion \
                      gcc gcc-c++ \
                      libtool libtool-ltdl \
                      make cmake \
                      pkgconfig \
                      automake autoconf \
                      spectool rpm-build \
    && yum clean all \
    && yum clean all \
    && useradd builder -u 1000 -m -G users,wheel \
    && echo "builder ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /opt/builder \
    && dos2unix /opt/builder/*.sh \
    && chown -R builder:root /opt/builder/ \
    && chmod -R 777 /opt/builder/

COPY configs/ /

USER builder

VOLUME /opt/builder/in
VOLUME /opt/builder/out

CMD mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SRPMS,SOURCES,SPECS} \
    && cp -f /opt/builder/in/spec ~/rpmbuild/SPECS/ \
    && if [ -d /opt/builder/in/src ]; then cp -rf /opt/builder/in/src/* ~/rpmbuild/SOURCES/; fi \
    && bash /opt/builder/sources.sh \
    && dos2unix ~/rpmbuild/SPECS/spec \
    && spectool -g -R ~/rpmbuild/SPECS/spec \
    && rpmbuild -ba ~/rpmbuild/SPECS/spec \
    && rm -rf /opt/builder/out/* \
    && cp -r ~/rpmbuild/RPMS/* /opt/builder/out/
