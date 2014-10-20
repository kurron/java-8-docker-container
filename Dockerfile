# Trusty 
FROM ubuntu:14.04

MAINTAINER Ron Kurr <kurr@kurron.org>

# import the WebUpd8 public key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv EEA14886

# add the WebUpd8 repository
RUN echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' | sudo tee /etc/apt/sources.list.d/webupd8.list

# Automatically select the Oracle License 
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections 

# fetch the latest software updates
RUN apt-get --quiet update

# install JDK
RUN apt-get --quiet --yes install oracle-java8-installer 

# install JDK environment variables
RUN apt-get --quiet --yes install oracle-java8-set-default 

# make sure the Oracle JDK is in the path
RUN which java
RUN java -version

