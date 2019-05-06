Exercise: Write your own Dockerfile!
====================================

1) cowsay

Write the Dockerfile of an application, that prints out a given Text:

- set base image: docker/whalesay
- set the application, that should be executed inside the container (ENTRYPOINT vs. CMD): cowsay
- Optional: Install a Random Text generator and pipe the text to the application "cowsay".
    - install fortunes
    - pipe the output of the application /usr/games/fortune to cowsay

2) countdown

Write The dockerfile for ./countdown/Dockerfile

3) identicon

Write The dockerfile for ./identicon/Dockerfile