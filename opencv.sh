if [ ! -d /runtime ];then
  sudo mkdir /runtime
fi
sudo chown $USER /runtime
cd /runtime 

if [ ! -d opencv ];then
  git clone https://github.com/Itseez/opencv
else
  echo 'folder opencv already exists'
fi

cd opencv
if [ ! -d build ];then
  mkdir build
fi

if [ ! -d install ];then
  mkdir install
fi
cd build
cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=../install ..
echo 'install opencv in /runtime/opencv/install/'
echo '#opencv' >> ~/.bashrc
echo 'export PYTHONPATH=/runtime/opencv/install/lib/python2.7/dist-packages:$PYTHONPATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/runtime/opencv/install/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export C_INCLUDE_PATH=/runtime/opencv/install/include:$C_INCLUDE_PATH' >> ~/.bashrc
echo 'export CPLUS_INCLUDE_PATH=/runtime/opencv/install/include:$CPLUS_INCLUDE_PATH' >> ~/.bashrc
echo 'export PKG_CONFIG_PATH=/runtime/opencv/install/lib/pkgconfig:$PKG_CONFIG_PATH' >> ~/.bashrc
source ~/.bashrc