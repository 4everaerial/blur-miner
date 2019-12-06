#!/bin/bash
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

dir="blur-miner"

rm -rf ${dir}/build
mkdir -p ${dir}/build
cd ${dir}/build

cmake -WITH_OPENCL=OFF ${dir}
make 

#mkdir -p ${dir}/build/cuda
#cd ${dir}/build/cuda

#cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-6 ${dir}/xmrig-cuda
#make -j6

#cp ./libxmrig-cuda.so ../libxmrig-cuda.so

cd ${dir}
cp ${dir}/src/config.json ${dir}/build/config.json