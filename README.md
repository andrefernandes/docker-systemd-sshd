SSHD on SystemD
===============

CentOS 7 + SSHD (systemd activation)

The whole thing with Docker is that you are NOT
supposed to install SSHD or anything else except
the very job your container will provide.

But sometimes this job itself is SSH-based, so here
it goes.

This container runs SSHD for general-purpose services
that rely on it (i.e. derived images). I am creating it
right now to experiment a few web-based SSH terminals.

It goes with a default "user" user, password "secret".

It also has a "removekeys.sh" script that is supposed
to regen the sshd keys if you ever call it. Feel free
to call it on derived Dockerfiles.

SSHD is started by "/usr/sbin/init" (systemd).


