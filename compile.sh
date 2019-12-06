#!/bin/bash
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

dir="blur-miner"

cd blur-miner
rm -r build
mkdir build
cd build

cmake -WITH_OPENCL=OFF ..
make 

#mkdir -p ${dir}/build/cuda
#cd ${dir}/build/cuda

#cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-6 ${dir}/xmrig-cuda
#make -j6

#cp ./libxmrig-cuda.so ../libxmrig-cuda.so
touch ~/blur-miner/build/config.json
cat <<EOF > ~/blur-miner/build/config.json
{
    "api": {
        "id": null,
        "worker-id": null
    },
    "http": {
        "enabled": false,
        "host": "127.0.0.1",
        "port": 52542,
        "access-token": null,
        "restricted": true
    },
    "autosave": true,
    "background": false,
    "colors": true,
    "cpu": {
        "enabled": true,
        "huge-pages": true,
        "hw-aes": true,
        "priority": null,
        "memory-pool": false,
        "cn/blur": [
            [1, 0]
        ]
    },
    "opencl": {
        "enabled": false
    },
    "cuda": {
        "enabled": false,
        "loader": "./libxmrig-cuda.so",
        "nvml": true,
        "cn/blur": [{
            "index": 0,
            "threads": 64,
            "blocks": 30,
            "bfactor": 0,
            "bsleep": 0,
            "affinity": -1
        }]
    },
    "log-file": null,
    "pools": [{
        "url": "172.16.1.57:52542",
        "user": "bL4LTP47iL3EtkBhdAk15DfjekQD4qkTyHccamKn9HTYZavj2nzNJWphXS54e9fECAFeP7ks7qHoobmynKoYYUTL2dWctUGG9",
        "enabled": true,
        "tls": false,
        "tls-fingerprint": null,
        "daemon": true,
        "daemon-poll-interval": 25
    }],
    "print-time": 60,
    "health-print-time": 60,
    "retries": 5,
    "retry-pause": 5,
    "syslog": false,
    "user-agent": null,
    "watch": true
}
EOF
