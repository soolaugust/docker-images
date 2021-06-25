#! /bin/bash

image=${1}
tmp_image=${image#*\/}
gen_image=${tmp_image//[\/:]/-}

echo "will download this image from: registry.cn-hangzhou.aliyuncs.com/soolaugust/image:${gen_image}"
docker pull registry.cn-hangzhou.aliyuncs.com/soolaugust/image:${gen_image}
docker tag registry.cn-hangzhou.aliyuncs.com/soolaugust/image:${gen_image} ${image}
docker rmi registry.cn-hangzhou.aliyuncs.com/soolaugust/image:${gen_image}
echo -e ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> download successfully!\n"
