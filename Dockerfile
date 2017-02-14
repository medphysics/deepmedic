FROM ubuntu:16.04
RUN apt-get -y update && apt-get -y install --no-install-recommends apt-utils wget bzip2 git build-essential && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN cd /root && wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh --no-check-certificate -O /root/installer.sh && \
mkdir $HOME/anaconda && /bin/bash /root/installer.sh -b -f -p "$HOME/anaconda" && rm -rf /root/installer.sh
RUN /root/anaconda/bin/pip install theano sklearn nibabel pp 
RUN export PATH="$HOME/anaconda/bin:$PATH" && git config --global http.sslVerify false && \
git clone https://github.com/Kamnitsask/deepmedic.git && \
cd deepmedic && python setup.py install && rm -rf /root/deepmedic
RUN echo 'export PATH="$HOME/anaconda/bin:$PATH"' > /root/.profile
WORKDIR /root
