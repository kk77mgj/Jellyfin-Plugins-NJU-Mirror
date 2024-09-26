#!/bin/bash

# download manifest.json
if ../temp not exists; then
    mkdir ../temp
fi
wget -p ../temp https://mirrors.nju.edu.cn/jellyfin/files/plugin/manifest.json

# update url
if ../temp/manifest.json exists; then
    sed -i 's_https://repo.jellyfin.org_https://mirrors.nju.edu.cn/jellyfin_' ../temp/manifest.json
    if ../manifests not exists; then
        mkdir ../manifests
    fi
    mv ../temp/manifest.json ../manifests/manifest.json
    git config --global user.email "github-actions[bot]@users.noreply.github.com"
    git config --global user.name "GitHub Actions [Bot]"
    git add ../manifests/manifest.json
    git commit -m "update manifest.json"
fi
