cd && rm -rf $HOME/storage_0gchain_snapshot.lz4 && sudo apt-get install wget lz4 aria2 pv -y
# Standard Contract
aria2c -x 16 -s 16 http://snapshot_2.zstake.xyz/downloads/storage_0gchain_snapshot.lz4

sudo systemctl stop zgs && rm -r $HOME/0g-storage-node/run/db && rm -r $HOME/0g-storage-node/run/log && rm -r $HOME/0g-storage-node/run/network

lz4 -c -d storage_0gchain_snapshot.lz4 | pv | tar -x -C $HOME/0g-storage-node/run

sudo systemctl start zgs
