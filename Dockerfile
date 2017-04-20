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

ENV USER_NAME reflex
ENV HOME_DIR /$USER_NAME

## Set up user "reflex" to run try-reflex
## Assign arbitrary uid to avoid collision with user on host machine
RUN adduser --disabled-password --gecos '' $USER_NAME --home $HOME_DIR --uid 21348 > /dev/null 2>&1 
RUN adduser $USER_NAME sudo > /dev/null 2>&1 

## Script to run commands as reflex user.
COPY run-as-reflex.sh /

## Prepare reflex-platform clone as user "reflex", 
RUN /run-as-reflex.sh 'cd ; git clone https://github.com/reflex-frp/reflex-platform.git'

# User configuration needed for tests.
COPY setup-reflex-user.sh /
RUN /run-as-reflex.sh '/setup-reflex-user.sh'

# Run try-reflex (takes a while the first time)
RUN /run-as-reflex.sh '~/reflex-platform/try-reflex --run exit'

# run commands as user reflex by default
ENTRYPOINT ["/run-as-reflex.sh"]

# run try-reflex by default.
CMD ["~/reflex-platform/try-reflex"]

## Make sure tmux runs with /bin/bash and not the nix bash.
## Otherwise arrow keys in bash don't work right.
COPY tmux.conf $HOME_DIR/.tmux.conf

# Set the locale 
# Got this originally here: # http://askubuntu.com/questions/581458/how-to-configure-locales-to-unicode-in-a-docker-ubuntu-14-04-container
#
# Prevents some terminal related problems.
#
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  
