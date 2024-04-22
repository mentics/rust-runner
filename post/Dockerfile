FROM rust-runner-mid
LABEL org.opencontainers.image.source = "https://github.com/mentics/rust-runner"

USER root
RUN <<EOT
apt-get remove -y curl libdigest-sha-perl
apt-get autoremove -y
apt-get clean
EOT

USER gh
WORKDIR /home/gh/actions-runner
#ENV PATH=/home/gh/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash","-l","-c","./run.sh"]
#CMD ["/bin/bash","-l","-c","echo ${PATH}"]
