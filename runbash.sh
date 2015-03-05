ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
SSHPORT=${SSHPORT:-8022}
echo "Will use $SSHPORT port"

docker run --rm -t -i -p $SSHPORT:22 --privileged andrefernandes/docker-systemd-sshd:latest $ENVBASH ${@:2}

