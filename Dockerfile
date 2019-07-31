FROM nvidia/cuda:10.0-base-ubuntu18.04

RUN apt-get update &&  apt-get install -y --no-install-recommends \
    wget \
    rsync \
    \
    python3=3.6.7-1~18.04 \
    python3-pip=9.0.1-2.3~ubuntu1.18.04.1 \
    python3-setuptools=39.0.1-2

# Heavy 700Mb 
RUN pip3 install --no-cache-dir \
    https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl
RUN pip3 install --no-cache-dir \
    tqdm \
    jupyter==1.0.0 \
    awscli==1.16.204 \
    joblib==0.13.2 \
    \
    tensorboard==1.14.0 \
    # scalar update does not work without tensorflow
    tensorflow==1.13.1 \
    # ImportError: No module named 'past'
    future==0.17.1 \
    Pillow==6.0.0 \
    \
    numpy==1.16.2 \
    imageio==2.2.0 \
    scikit-image==0.15.0 \
    matplotlib==3.0.2

EXPOSE 6006 8888

WORKDIR /root
COPY onstart.sh .

CMD ["/bin/bash", "onstart.sh"]
