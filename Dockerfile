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
    git \
    net-tools \
    openssh-server \
    python \
    tmux \
    sudo \
    vim-gtk 

## enable sudo w/o password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /workarea
RUN chmod 777 /workarea
COPY build_scripts /workarea
RUN /workarea/setup_sshd
