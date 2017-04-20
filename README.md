# dockerfile_try-reflex 
# A quick & easy reflex dev environment.

## Build:
    docker build -t try-reflex .

## Run:
    docker run -it try-reflex

or from published image:

    docker run -it davecompton/try-reflex

The start.sh script will run try-reflex as user "reflex".  This script starts a nix shell in which you can run ghcjs to compile programs that use reflex and reflex-dom.

## tmux

For a better working environment, run tmux from the container shell prompt.  Inside of tmux you can create multiple tmux "panes", each with its own bash session.  I couldn't figure out how to automate this.  If you get it working (automatically) please let me know how.

## Customization

When starting a docker container with "docker run" ( as shown above ) you can use the -v option to access a directory on your computer from inside the container:

    docker run -it -v /home/dave:/home_in_container/dave try-reflex

If you are using this -v option to access a directory on your host computer you might want the "reflex" user in the container to have the same user id as you have on your host computer.  You can find out your user id with the following shell command:
    
    id -u 

Use the --uid option to "adduser" in the Dockerfile to specify the user id for the "reflex" user:

    RUN adduser --disabled-password --gecos '' $USER_NAME --home $HOME_DIR --uid <ID> > /dev/null 2>&1 
