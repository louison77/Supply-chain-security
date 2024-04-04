FROM ubuntu:latest
COPY Supply-chain-security /usr/bin/Supply-chain-security
RUN chmod +x /usr/bin/Supply-chain-security
CMD ["/usr/bin/Supply-chain-security"]