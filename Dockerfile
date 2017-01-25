FROM debian:latest
MAINTAINER "Shannon Carver" <shannon.carver@gmail.com>

# Machine Setup
RUN apt-get update && \
    apt-get install -y libssl-dev libjansson-dev libcurl4-openssl-dev libmysqlclient-dev \
             sendemail vim g++ gcc make && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Build Process
RUN mkdir -p /application/logs
ADD Makefile stop_after_notrade_ LICENSE /application/code/
ADD ./src/ /application/code/src/
#ADD ./Makefile /application/code
#ADD ./stop_after_notrade_ /application/code
WORKDIR /application/code
RUN make && cp blackbird /application
WORKDIR /application
ADD ./entrypoint.sh /application/entrypoint.sh

#EXPOSE 51222 

#CMD ["/usr/local/bin/start.sh"]
CMD ["/application/entrypoint.sh"]
