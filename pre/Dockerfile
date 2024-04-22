FROM ubuntu

SHELL ["/bin/bash", "-l", "-c"]

RUN <<EOT
apt-get update
apt-get install -y curl libdigest-sha-perl build-essential
useradd -m gh
chsh -s /bin/bash gh
EOT

RUN apt-get install -y docker.io

USER gh
RUN <<EOT
cd /home/gh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --profile=minimal

mkdir -p actions-runner && cd actions-runner
curl -o actions-runner-linux-arm64-2.315.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.315.0/actions-runner-linux-arm64-2.315.0.tar.gz
echo "d9d58b178eca5fb65d93d151f3b62bde967f8cbec7c72e9b0976e9312b7f7dda  actions-runner-linux-arm64-2.315.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-arm64-2.315.0.tar.gz
EOT

RUN <<EOT
mkdir -p /tmp/sccache
cd /tmp/sccache
curl -L -o sccache.tgz https://github.com/mozilla/sccache/releases/download/v0.8.0/sccache-v0.8.0-aarch64-unknown-linux-musl.tar.gz
tar xfz sccache.tgz
cd sccache-*
mv sccache ${HOME}/.cargo/bin/
cd
rm -rf /tmp/sccache
EOT
ENV RUSTC_WRAPPER=sccache

USER root
RUN <<EOT
/home/gh/actions-runner/bin/installdependencies.sh
apt-get remove -y curl libdigest-sha-perl
apt-get autoremove -y
apt-get clean
EOT

USER gh

WORKDIR /home/gh
