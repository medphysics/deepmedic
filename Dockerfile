FROM ubuntu:16.04
RUN apt-get -y update && apt-get -y install --no-install-recommends apt-utils wget bzip2 && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN cd /root && wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh -O /root/installer.sh && mkdir $HOME/anaconda && \
/bin/bash /root/installer.sh -b -f -p "$HOME/anaconda" && rm -rf /root/installer.sh
RUN echo 'export PATH="$HOME/anaconda/bin:$PATH"' > /root/.profile
