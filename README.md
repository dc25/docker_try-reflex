# dockerfile_try-reflex

# Build:
    docker build -t try-reflex .

# Run:
    docker run -it --entrypoint /start.sh try-reflex

The start.sh script will run try-reflex as user "reflex".  This script starts a nix shell in which you can run ghcjs to compile programs that use reflex and reflex-dom.

# First Time:

The first time you run (as shown above) the try-reflex script will take a while to complete ( perhaps an hour or so ).  Use "docker commit" so that this work does not have to be repeated:

    docker commit <containerName> try-reflex

