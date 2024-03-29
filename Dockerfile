FROM centos:centos7

LABEL name="CentOS RepoSync"
ENV container oci
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Update system and install necessary packages
RUN yum install -y epel-release \
    && yum update -y \
    && yum install -y yum-utils

# Add ELRepo
RUN rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org && \
    rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm


# Create directory for repos
RUN mkdir -p /repos

# Copy the script file
COPY syncfile.sh /tmp/syncfile.sh

# Give execution permission
RUN chmod +x /tmp/syncfile.sh

# Define a volume for the repos
VOLUME [ "/repos" ]

# Change to /repos directory
WORKDIR /repos

# Run the script when the container launches
CMD ["/bin/bash", "/tmp/syncfile.sh"]
