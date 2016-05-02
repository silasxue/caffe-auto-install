# install python dependencies
echo 'install python-dependencies...'
sudo chown -R $USER /usr/local/ 
python get-pip.py
pip install numpy scipy Cython 
sudo ln -s /usr/local/lib/python2.7/dist-packages/numpy /usr/lib/python2.7/dist-packages/numpy
pip install scikit-image scikit-learn 
pip install matplotlib 
#sudo pip install pyopencv
pip install ipython jupyter
pip install h5py leveldb lmdb protobuf 
pip install networkx nose
pip install pandas
pip install python-dateutil
pip install python-gflags pyyaml Pillow six pyzmq singledispatch
pip install backports_abc certifi jsonschema graphviz  qtawesome pydot