#tensorflow
if [ ! -d '/runtime/' ];then
  sudo mkdir /runtime/
fi
sudo chmod 777 /runtime/
cd /runtime/

#install bazel
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install swig
if [ ! -d '/runtime/bazel/' ]; then
	cd /runtime/
    git clone https://github.com/bazelbuild/bazel.git
fi
cd bazel
./compile.sh
echo 'export PATH=/runtime/bazel/output/:$PATH' >> ~/.bashrc
source ~/.bashrc
#clone tenforflow source code
if [ ! -d '/runtime/tensorflow/' ]; then
	cd /runtime/
    git clone --recurse-submodules https://github.com/tensorflow/tensorflow
fi

#configure and build tensorflow
cd /runtime/tensorflow
./configure
bazel build -c opt --config=cuda //tensorflow/cc:tutorials_example_trainer

#build pip package
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg

TF_WHL="$(ls /tmp/tensorflow_pkg/tensorflow*.whl)"
pip install $TF_WHL

mkdir _python_build
cd _python_build
ln -s ../bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles/* .
ln -s ../tensorflow/tools/pip_package/* .
python setup.py develop