Exercise: Linting!
==================

1. Check the following files for linting errors:

    - ./jenkins/Dockerfile
    - ./countdown/Dockerfile
    - ./identicon/Dockerfile

1. Improve the Dockerfiles


Hints:
------

To lint a Dockerfile run the following command:

```
docker run --rm -i hadolint/hadolint < Dockerfile
```

Print the package version with: 

```
apt-cache policy <package-name>
```
