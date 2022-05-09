FROM ethereum/client-go:latest
ADD . /var/zenith
WORKDIR /var/zenith
RUN geth init /var/zenith/genesis.json --datadir /var/zenith/.zenith
EXPOSE 30303 8545 8546
ENTRYPOINT [ "geth" , "--config", "/var/zenith/config.toml", "--cache" ,"8000" ,"--nat" ,"extip:13.209.115.137"]


