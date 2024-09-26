#!/bin/bash
sed -i 's_https://github.com_https://ghp.ci/https://github.com_' temp/manifest.json
sed -i 's_https://raw.githubusercontent.com_https://ghp.ci/https://raw.githubusercontent.com_' temp/manifest.json