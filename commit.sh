#! /bin/bash

image=${1}
tmp_image=${image#*\/}
gen_image=${tmp_image//[\/:]/-}

git checkout .
git pull 
echo "From ${image}" > Dockerfile
echo ">>>>>>>>>>>>>>>>>Dockerfile has changed to :" cat Dockerfile
echo -e ">>>>>>>>>>>>>>>>>start to commit change for image: "${image}"\n"
git add .
git commit -m "add images '${image}'"
git tag release-v${gen_image}
git push --tags
echo -e ">>>>>>>>>>>>>>>>>commit successfully!\n"
echo -e "You can download image by following command:\n"
echo -e "./download.sh ${image}\n"
echo "*************************************************"
echo "If download failed after a long time, please submit a issue at: https://github.com/soolaugust/containers/issues"
echo "*************************************************"