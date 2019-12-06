#!/bin/bash
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

dir="blur-miner"

cd blur-miner
mkdir build
cd build

cmake -WITH_OPENCL=OFF ..
make 

#mkdir -p ${dir}/build/cuda
#cd ${dir}/build/cuda

#cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-6 ${dir}/xmrig-cuda
#make -j6

#cp ./libxmrig-cuda.so ../libxmrig-cuda.so

cd 
cd blur-miner
cp /src/config.json /build/config.json
