FROM ubuntu:latest
COPY supply-chain-security /usr/bin/supply-chain-security
RUN chmod +x /usr/bin/supply-chain-security
CMD ["/usr/bin/supply-chain-security"]