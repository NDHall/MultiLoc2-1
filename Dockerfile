# Applied Bioinformatics Group
# MultiLoc2 Docker Image
#
# Philipp Thiel

FROM ubuntu:14.04

# Update package repository
RUN apt-get update
#RUN apt-get -y upgrade


# ----------------------------------------------------------
# Install some useful and required stuff
# ----------------------------------------------------------
RUN apt-get install -y dirmngr software-properties-common vim wget


# ----------------------------------------------------------
# Install LibSVM and BLAST
# ----------------------------------------------------------
RUN apt-get install -y libsvm-tools ncbi-blast+


# ----------------------------------------------------------
# Install MultiLoc2
# ----------------------------------------------------------
COPY MultiLoc2 /MultiLoc2
WORKDIR /MultiLoc2
RUN python configureML2.py

WORKDIR /
RUN  chown -R www-data:www-data /MultiLoc2
RUN  chmod -R 775 /MultiLoc2



CMD ["/usr/bin/python2.7", "/MultiLoc2/src/multiloc2_prediction.py"]
