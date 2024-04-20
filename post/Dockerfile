FROM rust-runner-mid as build
LABEL org.opencontainers.image.source = "https://github.com/mentics/rust-runner"

USER root
RUN <<EOT
apt-get remove -y curl libdigest-sha-perl
apt-get autoremove -y
apt-get clean
EOT

USER gh
WORKDIR /home/gh/actions-runner
CMD ./run.sh

FROM build
