echo 'install lib dependencies...'
sudo chown -R $USER /usr/local/ 
sudo apt-get update
sudo apt-get install git python-dev libboost-all-dev libprotobuf-dev \
libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev cmake \
protobuf-compiler libgflags-dev libgoogle-glog-dev liblmdb-dev \
clang liblapack-dev libatlas-base-dev libblas-dev gfortran graphviz
echo 'install python-dependencies...'
./py-denp.sh

echo 'checkout caffe source code and build..'
cd ~/
git clone https://github.com/BVLC/caffe
cd caffe
cp Makefile.config.example Makefile.config
echo 'CPU_ONLY := 1' >> Makefile.config
make all
echo "done!"
