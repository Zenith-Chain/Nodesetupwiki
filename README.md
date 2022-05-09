There are 2 ways to run a zenith mainnet node. You can either run it as a service or as a docker client. Both these methods enable the HTTP RPC server on port 8545 and the WS server on port 8546. 

<h2>Method 1 (Docker Client)</h2>

1. Ensure you have [docker](https://docs.docker.com/get-docker/) installed.
2. Run the following commands:
```
docker build -t geth:v1 .
docker run -it geth:v1
```


<h2>Method 2 (Service)</h2>

1. Install [geth](https://geth.ethereum.org/docs/install-and-build/installing-geth).

2. Download [genesis.json](https://github.com/Ekkel-AI-Private-Limited/setup-zenith-node/blob/main/genesis.json). Initialize geth:
```
geth init genesis.json --datadir /var/zenith/.zenith
```

2. Create config.toml

```
cd /var
mkdir zenith
cd zenith
sudo nano config.toml
```

Copy the contents of [config.toml](https://github.com/Ekkel-AI-Private-Limited/setup-zenith-node/blob/main/config.toml) to this newly created file

3. Create zenith.service
```
cd /lib/systemd/system
sudo touch zenith.service
sudo nano zenith.service
```

```
[Unit]
Description=Zenith Server
After=syslog.target network.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/bin/geth --config /var/zenith/config.toml --nat extip:<YOUR_IP> --http --http.port "8545" --http.api eth,net,web3,txpool --http.corsdomain "*" --http.addr "0.0.0.0" --ws --ws.port "8546" --ws.addr "0.0.0.0" --ws.api eth,net,web3,txpool --ws.origins "*"
KillMode=process
KillSignal=SIGINT
TimeoutStopSec=90
Restart=on-failure
RestartSec=10s
```

Replace <YOUR_IP>

This will run a full node, alongwith enabling HTTP and WS servers for that node, exposing the eth, net, web3, and txpool apis. If you require more configuration, kindly refer to the [geth documentation](https://geth.ethereum.org/docs/).

4. Run the service
```
sudo systemctl daemon-reload
sudo systemctl restart zenith
sudo systemctl enable zenith
sudo systemctl status zenith
```
