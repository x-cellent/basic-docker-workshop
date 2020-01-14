Exercise: Linting!
==================

1. Check the following files for linting errors:

    - ./jenkins/Dockerfile
    - ./countdown/Dockerfile
    - ./identicon/Dockerfile

1. Improve the Dockerfiles


Solution:
=========

Check the Dockerfiles here to see example solutions.

Command: 

```
docker run --rm -t -v $PWD:/pwd:ro hadolint/hadolint hadolint /pwd/Dockerfile
```
