#Selenium Testing Dockerfile on Red Hat Linux
#

FROM fedora
MAINTAINER tamarojgreen@hotmail.com

#ARG SELTEST_URI=git@github.com:tamarojgreen/automated-testing.git
ARG SELTEST_URI=https://github.com/tamarojgreen/automated-testing.git

#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
RUN dnf install -y ca-certificates \
    sudo \
    unzip \
    wget \
    tar

RUN dnf install -y java-1.8.0-openjdk
RUN dnf install -y java-1.8.0-openjdk-devel


#========================
# Python for python tests
#
#========================
RUN wget --no-check-certificate https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
RUN tar -xzf Python-2.7.11.tgz  
RUN cd Python-2.7.11


#==========
# Selenium
#==========
RUN  mkdir -p /opt/selenium \
  && wget --no-verbose https://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar -O /opt/selenium/selenium-server-standalone.jar


WORKDIR /var/lib/seltest

#RUN dnf -y install git
#RUN git clone ${SELTEST_URI}


EXPOSE 4444 

#CMD ["mvn clean install"]

