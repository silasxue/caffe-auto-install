##caffe自动安装
###安装普通依赖项,编译cpu-only caffe:
* 使用`caffe.sh`来安装caffe需要的c++库以及python包.
* `caffe.sh`会在home目录下载caffe源代码并编译cpu-only版caffe

至此,caffe已经安装完成,但没有GPU支持.

如果你的计算机安装有支持`cuda`的显卡, 请继续按一下步骤安装`cuda`

###安装cuda, 编译caffe_with_gpu
* 根据你的系统版本 [下载](https://developer.nvidia.com/cuda-downloads) cuda离线安装包,在"Architecture"这个选项中, **Intel x_64**或者**AMD x_64** CPU请选择`x_86_64`, IBM P8工作站请选择`ppc64le`, 最后install type选择`deb(local)`本地安装文件.
* 使用`cuda.sh xxx.deb`安装cuda, `xxx.deb`为上一步下载的安装包文件名.
* **进入`caffe`目录将`Makefile.config`文件中的`CPU_ONLY := 1`注释掉.**
* 使用`make`命令重新编译caffe.

###简洁安装和python包管理
* `auto.sh`默认安装了caffe所需要的所有依赖, 包括画网络结构图等其他非必须工具所依赖的python包, 所以安装会比较耗时.
* 如果需要**简洁安装**可使用`lite.sh`, 仅安装caffe编译时必要的c++库, 不安装python包, 你可以简便编译安装caffe, 视情况需要安装python包.
* python包之间的依赖关系很复杂, 在ubuntu下强烈**不建议**使用`apt-get install python-xx`来安装管理python package, 推荐使用pip,Mac环境也适用, 使用`caffe.sh`安装会自动安装`pip`包管理器并使用`pip`安装python包.

###Tensorflow, Torch和其它
* `tf.sh`自动从源代码安装**tensorflow**, 同时从源代码安装Google的build工具**bazel**. 注意安装的过程中会询问一些配置的问题, 例如是否配置`CUDA`,`CUDA`所在的目录,`CUDNN`的目录等等, 除非明确知道,否则建议都选择默认(直接按回车表示默认).
* `torch.sh`自动安装**torch**.

___

如果使用中碰到问题, 欢迎邮件到<zeakey@outlook.com>
