FROM ubuntu

RUN <<EOT
apt-get update
apt-get install -y curl libdigest-sha-perl
useradd -m gh
chsh -s /bin/bash gh
EOT

USER gh
RUN <<EOT
cd /home/gh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --profile=minimal

mkdir -p actions-runner && cd actions-runner
curl -o actions-runner-linux-arm64-2.315.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.315.0/actions-runner-linux-arm64-2.315.0.tar.gz
echo "d9d58b178eca5fb65d93d151f3b62bde967f8cbec7c72e9b0976e9312b7f7dda  actions-runner-linux-arm64-2.315.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-arm64-2.315.0.tar.gz
EOT

USER root
RUN <<EOT
/home/gh/actions-runner/bin/installdependencies.sh
apt-get remove -y curl libdigest-sha-perl
apt-get autoremove -y
apt-get clean
EOT

USER gh

WORKDIR /home/gh