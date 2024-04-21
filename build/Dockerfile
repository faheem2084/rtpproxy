# Use a specific version of Alpine Linux
FROM alpine:3.14

# Install dependencies, including CA certificates
RUN apk --no-cache add \
    ca-certificates \
    net-tools \
    iproute2 \
    sed \
    build-base \
    git \
    libcurl \
    libxml2-dev \
    perl \
    perl-utils \
    perl-dev \
    iptables

# Install Perl Bencode module using CPAN
RUN cpan -i Net::Bencode

# Clone and build RTPproxy
WORKDIR /usr/src
RUN git config --global http.sslVerify true && \
    git clone -b master https://github.com/sippy/rtpproxy.git && \
    git -C rtpproxy submodule update --init --recursive && \
    cd rtpproxy && \
    ./configure && \
    make clean all && \
    make install && \
    cd .. && \
    rm -rf rtpproxy

# Copy the script
COPY ./rtpproxy.sh /rtpproxy.sh
RUN chmod +x /rtpproxy.sh

EXPOSE 8844/udp
ENTRYPOINT ["/rtpproxy.sh"]
