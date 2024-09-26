#!/bin/bash

if [ $# -lt 2 ];then
echo 'Please input plugin name and url of manifest.json'
exit 0
fi

name=$1
url=$2
tmp_dir="temp"

# download manifest.json
if [ ! -d temp ]; then
    mkdir temp
else
    if [ "$( ls -A $tmp_dir )" ];then
        rm temp/*.json
    fi
fi
wget "$url" -O temp/manifest.json
echo "Downloading finished"

# update url
if [ -f temp/manifest.json ] ; then
    scripts/replace_github_url.sh temp/manifest.json
    if [ ! -d manifests ]; then
        mkdir manifests
    fi
    mv temp/manifest.json manifests/"${name}"_manifest.json
    git config --global user.email "github-actions[bot]@users.noreply.github.com"
    git config --global user.name "GitHub Actions [Bot]"
    git add manifests/"${name}"_manifest.json
    git commit -m "update ${name}_manifest.json"
else
    echo "${name} manifest download failed"
fi
