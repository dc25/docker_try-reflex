# dockerfile_try-reflex

# Build:
    docker build -t try-reflex .

# Run:
    docker run -it --entrypoint /start.sh try-reflex

The start.sh script will run try-reflex as user "reflex".  This script starts a nix shell in which you can run ghcjs to compile programs that use reflex and reflex-dom.

# First Time:

The first time you run (as shown above) the try-reflex script will take a while to complete ( perhaps an hour or so ).  Use "docker commit" so that this work does not have to be repeated:

    docker commit <containerName> try-reflex

# tmux

For a better working environment, run tmux.  Inside of tmux you can create multiple tmux "panes", each with its own bash session.

# Customization

When starting a docker container with "docker run" ( as shown above ) you can use the -v option to access a directory on your computer from inside the container:

    docker run -it -v /home/dave:/home_in_container/dave --entrypoint /start.sh try-reflex

If you are using this -v option to access a directory on your host computer you might want the "reflex" user in the container to have the same user id as you on your host computer.  You can find out your user id with the following shell command:
    
    id -u 

You can specify the user id for the "reflex" user at docker build time by adding the --uid option to the "adduser" line in the Dockerfile:

    RUN adduser --disabled-password --gecos '' $USER_NAME --home $HOME_DIR --uid <ID> > /dev/null 2>&1 
