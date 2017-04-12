FROM ubuntu:16.10

# Set the locale - was (and may still be ) necessary for ghcjs-boot to work
# Got this originally here: # http://askubuntu.com/questions/581458/how-to-configure-locales-to-unicode-in-a-docker-ubuntu-14-04-container
#
# 2015-10-25 It seems like ghcjs-boot works without this now but when I 
# removed it, vim starting emitting error messages when using plugins 
# pathogen and vim2hs together.  
#
# 2016-07-11 Tried taking it out again.
# 2016-07-11 Did not notice problems with vim but saw errors reported that 
#            were not there before when running ./try-reflex . Leaving in.
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get update && apt-get install -y \
    bzip2 \
    cpio \
    curl \
    daemontools \
    entr \
    gcc \
    git \
    make \
    net-tools \
    openssh-server \
    python \
    tmux \
    sudo \
    vim-gtk 

## enable sudo w/o password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY start.sh /

## set up user "reflex" to run try-reflex
ENV USER_NAME reflex
ENV HOME_DIR /$USER_NAME

RUN adduser --disabled-password --gecos '' $USER_NAME --home $HOME_DIR > /dev/null 2>&1 
RUN adduser $USER_NAME sudo > /dev/null 2>&1 

## copy in config files and script, "user_configuration.sh"
## to do the remaining setup as user "reflex"
COPY reflex_home $HOME_DIR
RUN sudo su $USER_NAME -c $HOME_DIR/user_configuration.sh
