# How to Run A Fullnode on Zenith Chain
Here's the instruction to setup a full node of Zenith Chain.

### Fullnodes Functions
- Stores the full blockchain history on disk and can answer the data request from the network.
- Receives and validates the new blocks and transactions.
- Verifies the states of every accounts

### Supported Platforms
- Only `Linux` is demonstrated as of now

### Suggested Requirements
#### Fullnode
- VPS running recent versions of `Linux`.
- IMPORTANT 1T GB of free disk space, solid-state drive(SSD), gp3, 3k IOPS, 125MB/S throughput, read latency <1ms. (if start with snap/fast sync, it will need NVMe SSD).
- 4 cores of CPU and 16 gigabytes of memory (RAM).
- A broadband Internet connection with upload/download speeds of 10 megabyte per second

#### Validator
- VPS running recent versions of `Linux`.
- IMPORTANT 1T GB of free disk space, solid-state drive(SSD), gp3, 3k IOPS, 125MB/S throughput, read latency <1ms. (if start with snap/fast sync, it will need NVMe SSD).
- 8 cores of CPU and 32 gigabytes of memory (RAM).
- A broadband Internet connection with upload/download speeds of 30 megabyte per second

` **** Note: That we are only accepting selective nodes to become a validator. `

### Setup
There are mainly 5 steps for spinning up a full node of zenith chain
- Install Geth
- Download latest chain snapshot to quickly sync the chain
- Download config.toml file
- Setup daemon
- Start node
##### Install Geth
Download the geth for your distribution of `Linux`. form official geth website.
##### Download latest chain snapshot to quickly sync the chain
Please download the chain data [`snapshot`](http://snapshot.zenithchain.co/zenith.zip) and extract to your home folder to speed up syncing process.
```bash
cd /var
mkdir zenith
cd zenith
wget http://snapshot.zenithchain.co/zenith.zip
unzip zenith.zip
```
##### Download config.toml and genesis.json file
```bash
wget https://raw.githubusercontent.com/p14041999/zenith-node-setup/master/config.toml
```
##### Setup daemon
Make a file called `zenith.service` in `/lib/systemd/system` in `Ubuntu`. For other distro check your documentation.
```bash
cd /lib/systemd/system
sudo touch zenith.service
sudo nano zenith.service
```
Now place the following code into the file 
```bash
[Unit]
Description=Zenith Server
After=syslog.target network.target

[Service]
User=<USERNAME>
Group=<GROUP>
Type=simple
ExecStart=/usr/bin/geth --datadir /var/zenith/.zenith/ --config /var/zenith/config.toml --cache 8000 --nat extip:<EXTIP>
KillMode=process
KillSignal=SIGINT
TimeoutStopSec=90
Restart=on-failure
RestartSec=10s

[Install]
WantedBy=multi-user.target
```
Make sure to replace `<USERNAME>`, `<GROUP>` and `<EXTIP>` as yours.

##### Start node
Start up the node by putting these commands in `Ubuntu 18.04` LTS or later.
```bash
sudo systemctl daemon-reload
sudo systemctl restart zenith
sudo systemctl enable zenith
sudo systemctl status zenith
```
### Common Problems
- Unable to connect the nodes
If its your case then create a static nodes json file inside `/var/zenith/.zenith/geth/static-nodes.json` and put following inside file.

```bash
[
"enode://7b0cdf97eac2e66a5539e2288d9054816f07e0bdf43d994f28c6157a726e200ee9e1bf22c9f33143f68ad683d7cbe6d68e2849a6a65d12140e607d9af91f2821@188.166.53.191:30303",
"enode://9c30754606ef4449c26a47752b8b7e556ec1402f97f1dd13544d3fae5cddae15584e0f8d11a684811d4f82431e9c48d964b6f2939a6e6f61fddc48816ba58a20@13.232.246.215:30303?discport=0",
"enode://e6dabe9aa87fa9345541fb4372894fc12c3f98454ea4b40e08d58e435e7d3b72bca1afa9ffdfd9f8c9a1817be349d66848c283c4a77c2ad7a265a090e8a9788e@104.197.222.164:30303"
]
```

