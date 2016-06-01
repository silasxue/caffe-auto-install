# install python dependencies
echo 'install python-dependencies...'
sudo chown -R $USER /usr/local/ 
python get-pip.py
pip install numpy scipy Cython 
sudo ln -s /usr/local/lib/python2.7/dist-packages/numpy /usr/lib/python2.7/dist-packages/numpy
echo '#numpy include path' >> ~/.bashrc
echo 'export CPP_INCLUDE_PATH=/usr/local/lib/python2.7/dist-packages/numpy/core/include:$CPP_INCLUDE_PATH' >> ~/.bashrc
echo 'export C_INCLUDE_PATH=/usr/local/lib/python2.7/dist-packages/numpy/core/include:$C_INCLUDE_PATH' >> ~/.bashrc
pip install scikit-image scikit-learn 
pip install matplotlib 
#sudo pip install pyopencv
pip install ipython jupyter
pip install 'protobuf>=3.0.0a3'
pip install h5py leveldb lmdb
pip install networkx nose
pip install pandas
pip install python-dateutil
pip install python-gflags pyyaml Pillow six pyzmq singledispatch
pip install backports_abc certifi jsonschema graphviz  qtawesome pydot

source ~/.bashrc