# containers

这个仓库是用来构建并下载被墙掉的镜像，比如 *gcr.io/xxx*等，

最终产生的镜像路径是： registry.cn-hangzhou.aliyuncs.com/soolaugust/containers：$containers-$version, 比如 gcr.io/kubernetes-helm/tiller:v2.12.3 会被替换成 registry.cn-hangzhou.aliyuncs.com/soolaugust/containers:kubernetes-helm-tiller-v2.12.3

* [下载代码](#download)
* [检查镜像是否存在](#check)
* [如何提交镜像](#title)
	* [使用脚本](#shell)
		* [修改并提交](#shell-submit)
		* [下载并替换](#shell-download)
	* [手动修改](#manual)
		* [更改Dockerfile](#manual-Dockerfile)
		* [提交修改](#manual-submit)
		* [下载并替换](#manual-download)

## <a name='download'></a>下载代码

1. 首先Fork本项目
2. 然后clone代码： 
```bash
git clone https://github.com/{your_name}/docker-images.git
cd docker-images/
````

## <a name='check'></a>检查镜像是否存在

使用下面命令检查镜像是否存在：

```bash
./download.sh gcr.io/kubernetes-helm/tiller:v2.12.3 #./download.sh $your_image
```

如果没有成功下载，则说明镜像不存在，使用[脚本](#shell)或者[手动](#manual)方式提交Pull Request。

##  <a name='title'></a>如何提交镜像

###  <a name='shell'></a>使用脚本

如果是在Linux开发环境下，可以使用脚本来简化操作。

####  <a name='shell-submit'></a>修改并提交

```bash
./commit.sh gcr.io/kubernetes-helm/tiller:v2.12.3
```

提交后创建Pull Request， 等待approve后执行下面的操作：

####  <a name='shell-download'></a>下载并替换

```bash
./download.sh gcr.io/kubernetes-helm/tiller:v2.12.3
```

###  <a name='manual'></a>手动修改

####  <a name='manual-Dockerfile'></a>更改Dockerfile

将 `$image` 替换成你要的镜像， 比如 gcr.io/kubernetes-helm/tiller:v2.12.3

####  <a name='manual-submit'></a>提交修改

```bash
git add .
git commit -m "add images 'gcr.io/kubernetes-helm/tiller:v2.12.3'" # 修改信息格式为 add images $your_images
git tag release-vkubernetes-helm-tiller-v2.12.3 # 提交格式为 git tag release-v$your_image中 ‘/, :’替换成‘-’
git push --tags
```

提交后创建Pull Request， 等待approve后执行下面的操作：

####  <a name='manual-download'></a>下载并替换

```bash
docker pull registry.cn-hangzhou.aliyuncs.com/soolaugust/image:kubernetes-helm-tiller-v2.12.3
docker tag registry.cn-hangzhou.aliyuncs.com/soolaugust/image:kubernetes-helm-tiller-v2.12.3 gcr.io/kubernetes-helm/tiller:v2.12.3
docker rmi registry.cn-hangzhou.aliyuncs.com/soolaugust/image:kubernetes-helm-tiller-v2.12.3
```

> 如果有任何问题，欢迎提交issue