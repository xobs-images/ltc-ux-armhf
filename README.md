ltc-ux
========

Web server for Love-to-Code.


Network
-------

Containers refer to each other using their names.  Be sure to put everything on the same network:

    docker network create ltc-network


Image
----------

This is the server that hosts files the users see.  It runs an nginx server that simply serves static files.

Build:

    docker build -t xobs/ltc-ux:1.6 .

Run:

    docker run -d --net=ltc-network --name ltc-ux xobs/ltc-ux:1.6

To do development on the frontend, check out the web page locally, and run ltc-ux with a local volume:

    git clone git@github.com:xobs/codebender-test-shell.git
    docker run -d --net=ltc-network -v $(pwd)/codebender-test-shell/app:/usr/share/nginx/html --name ltc-ux xobs/ltc-ux