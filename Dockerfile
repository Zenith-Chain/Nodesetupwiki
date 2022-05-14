FROM ethereum/client-go:v1.8.27
ADD . /var/zenith
WORKDIR /var/zenith
RUN geth init /var/zenith/genesis.json --datadir /var/zenith/.zenith
EXPOSE 8545 8546
ENTRYPOINT [ "geth" , "--config", "/var/zenith/config.toml", "--cache" ,"8000", "--nat" ,"extip:<EXT_IP>"]


