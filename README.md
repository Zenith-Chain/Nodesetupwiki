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
- Download config.toml and genesis.json file
- Initialize the node and setup daemon
- Start node
##### Install Geth

##### Download latest chain snapshot to quickly sync the chain
Please download the chain data [`snapshot`](https://snapshot.zenithchain.co) and extract to your home folder to speed up syncing process.
```bash
cd ~
mkdir zenith
unzip snapshot.zip -d ~/zenith
```
##### Download config.toml and genesis.json file

##### Initialize the node and setup daemon

##### Start node

