# dockerfile_try-reflex

# Build:
    docker build -t try-reflex .

# Run:
    docker run -it --entrypoint /start.sh try-reflex

# When running the first time, use:
    docker commit <containerName> try-reflex

