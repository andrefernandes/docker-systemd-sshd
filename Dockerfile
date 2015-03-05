# CentOS 7 + SSHD (systemd)

FROM andrefernandes/docker-systemd

MAINTAINER Andre Fernandes

WORKDIR /opt

RUN yum install -y openssh-server openssh-clients passwd sudo && \
    yum clean all

ENV USERPWD secret
ADD removekeys.sh /opt/removekeys.sh

RUN useradd -u 5001 -G users -m user && \
    echo "$USERPWD" | passwd user --stdin && \
    chmod +x /opt/removekeys.sh && \
    /usr/bin/ssh-keygen -A -v && \
    sed -i '/^session.*pam_loginuid.so/s/^session/# session/' /etc/pam.d/sshd && \
    rm /usr/lib/tmpfiles.d/systemd-nologin.conf

# passwordless sudo
ADD user /etc/sudoers.d/user

EXPOSE 22

CMD ["/usr/sbin/init"]

