LtC UX
============

This is the web frontend for the Love-to-Code interface.  It is a simple
Nginx server, with the added benefit of redirecting /compile to the LtC
compiler, also running in the same Pod.

Build the compiler container with:

    docker build \
          -t xobs/ltc-ux-armhf:${tag} \
          .

Make sure you have a network created specifically for ltc, to allow DNS:

    docker network create ltc-net

Run the web server with the following Docker arguments:

    docker run \
          -d \
          --name ltc-ux \
          --net=ltc-net \
          xobs/ltc-ux-armhf:${tag}

The web server will now be listening on port 80.


Using with LtC-Compiler
-----------------------

The ltc-ux image expects to be able to talk to an ltc-compiler image on port
9000.  It references this image by name, so it must be called "ltc-compiler"
and must be available on the same network.
