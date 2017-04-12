FROM ubuntu:16.10

RUN apt-get update && apt-get install -y \
    bzip2 \
    cpio \
    curl \
    git \
    net-tools \
    python \
    tmux \
    sudo \
    vim-gtk 

## Enable sudo w/o password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

## Set up user "reflex" to run try-reflex
ENV USER_NAME reflex
ENV HOME_DIR /$USER_NAME

RUN adduser --disabled-password --gecos '' $USER_NAME --home $HOME_DIR > /dev/null 2>&1 
RUN adduser $USER_NAME sudo > /dev/null 2>&1 

## Make sure tmux runs with /bin/bash and not the nix bash.
## Otherwise arrow keys in bash don't work right.
COPY tmux.conf $HOME_DIR/.tmux.conf

## Prepare reflex-platform clone as user "reflex", 
RUN sudo su $USER_NAME -c "cd $HOME_DIR; git clone https://github.com/reflex-frp/reflex-platform.git"

## Run "start.sh" when starting container
COPY start.sh /

# Set the locale 
# Got this originally here: # http://askubuntu.com/questions/581458/how-to-configure-locales-to-unicode-in-a-docker-ubuntu-14-04-container
#
# Prevents some terminal related problems.
#
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  
