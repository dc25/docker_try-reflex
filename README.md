# dockerfile_try-reflex

# Build:
    docker build -t try-reflex .

# Run:
    docker run -it --entrypoint /start.sh try-reflex

# First Time:

The first time you run (as shown above) the try-reflex script will take a while to complete ( perhaps an hour or so ).  Use "docker commit" so that this work does not have to be repeated:

    docker commit <containerName> try-reflex

