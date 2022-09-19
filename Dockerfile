FROM centos:centos7

LABEL name="CentOS RepoSync"
COPY syncfile.sh /tmp/syncfile.sh
RUN echo "Performing RepoSync. Hopefully you created a volume.." && \
    yum install -y epel-release && \
    yum update -y && \
    chmod 0755 /tmp/syncfile.sh && \
    mkdir -p /repos && cd /repos

VOLUME [ "/repos" ]

ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin



CMD [ "/bin/bash" ]
