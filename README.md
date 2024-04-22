In order to run docker commands inside this container, /var/run/docker.sock must be mounted with appropriate permissions. For example:
docker run -it -v /var/run/docker.sock:/var/run/docker.sock rust-runner

# Build

git clone https://github.com/mentics/rust-runner.git
cd rust-runner/pre
# Creates image rust-runner-pre
./build.sh
./run-for-config.sh
# Inside container
# Get and run config command from: https://github.com/organizations/mentics-ml-demo/settings/actions/runners/new?arch=arm64&os=linux
# Exit container
exit
# Save the most recent container to rust-runner-mid
./commit.sh
cd ../post
# Create image rust-runner
./build.sh
cd ..
# Run it, test a workflow against it, then ctrl-c to stop.
docker run -it -v /var/run/docker.sock:/var/run/docker.sock rust-runner
# then push to github container registry:
./push.sh

# Flattening
flatten.sh shows a way to do flattening but it removes CMD and such so can't do that naively. It only saved a few 10's of MB's anyway, so ignore for now.
