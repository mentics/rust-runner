FROM ubuntu

ARG DOCKER_GROUP_ID

SHELL ["/bin/bash", "-l", "-c"]

RUN <<EOT
set -x
apt-get update
apt-get install -y curl libdigest-sha-perl build-essential musl-tools cmake docker.io
groupadd -g ${DOCKER_GROUP_ID} docker
chmod 660 /var/run/docker.sock

useradd -m gh
chsh -s /bin/bash gh
gpasswd -a gh docker
EOT

USER gh
RUN <<EOT
set -x
cd /home/gh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --profile=minimal

mkdir -p actions-runner && cd actions-runner
curl -o actions-runner-linux-arm64-2.315.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.315.0/actions-runner-linux-arm64-2.315.0.tar.gz
echo "d9d58b178eca5fb65d93d151f3b62bde967f8cbec7c72e9b0976e9312b7f7dda  actions-runner-linux-arm64-2.315.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-arm64-2.315.0.tar.gz
EOT

RUN <<EOT
set -x
mkdir -p /tmp/sccache
cd /tmp/sccache
curl -L -o sccache.tgz https://github.com/mozilla/sccache/releases/download/v0.8.0/sccache-v0.8.0-aarch64-unknown-linux-musl.tar.gz
tar xfz sccache.tgz
cd sccache-*
mv sccache ${HOME}/.cargo/bin/
cd
rm -rf /tmp/sccache

rustup target add aarch64-unknown-linux-musl
EOT
ENV RUSTC_WRAPPER=sccache

USER root
RUN <<EOT
set -x
/home/gh/actions-runner/bin/installdependencies.sh
EOT

USER gh

WORKDIR /home/gh
