# Docker Ansible

## Background

There is a need to run ansible-vault encryption / decryption on terraform secret files when the build is controlled via Jenkins. 

## Builds

Builds are handled by [Travis CI](https://travis-ci.org/fritogotlayed/docker-ansible)

## Example Usage

* Assuming you have a shell script that runs `ansible-vault`
  * `docker run --env SOME_ENV=some_value -v $(pwd):/foo:rw fritogotlayed/docker-ansible bash -c 'cd /foo; echo "$SOME_ENV" ./path/to/script.sh arg1'`
