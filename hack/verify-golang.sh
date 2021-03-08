#!/usr/bin/env bash

###
#Copyright 2019 The KubeEdge Authors.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
###

set -o errexit
set -o nounset
set -o pipefail

# The root of the build/dist directory
KUBEEDGE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"

echo "go detail version: $(go version)"

goversion=$(go version |awk -F ' ' '{printf $3}' |sed 's/go//g')

echo "go version: $goversion"

X=$(echo $goversion|awk -F '.' '{printf $1}')
Y=$(echo $goversion|awk -F '.' '{printf $2}')

if [ $X -lt 1 ] ; then
	echo "go major version must >= 1, now is $X"
	exit 1
fi

if [ $Y -lt 12 ] ; then
	echo "go minor version must >= 12, now is $Y"
	exit 1
fi
