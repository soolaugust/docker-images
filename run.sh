#!/bin/bash
echo $ACCESSKEY:$SECRETKEY > ${HOME}/.passwd-s3fs
chmod 600 ${HOME}/.passwd-s3fs
s3fs -o url=$URL  -o use_path_request_style $BUCKET $DIR -o passwd_file=${HOME}/.passwd-s3fs -o nonempty -o dbglevel=info -f -o curldbg
