cd pre
1. run `build.sh` which will create image rust-runner-pre
2. run `run-for-config.sh` which puts you in a shell to run the rust runner config command, which is something like ./config.sh --url https://github.com/<your github user or org> --token <your token>
3. run `commit.sh` which takes the most recent image and commits it to an image called rust-runner-mid
cd ../post
4. run `build.sh` which cleans up a few things and crates the rust-runner-full image
cd ..
5. run `push.sh` to push the image to ghcr

Flattening removes CMD and such so can't do that. It only saved a few 10's of MB's anyway.
run `flatten.sh` which removes the history in the image and outputs the final rust-runner image
