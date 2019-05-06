Exercise: Linting!
==================

1) check the following files for linting errors:

- ./jenkins/Dockerfile
- ./countdown/Dockerfile
- ./identicon/Dockerfile

2) Improve the Dockerfiles!


Hints:
------

To lint a Dockerfile run the following command:

    docker run --rm -i hadolint/hadolint < Dockerfile

get the package version with: 

    apt-cache policy PACKAGENAME