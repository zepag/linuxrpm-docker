#!/bin/bash
build_rpmbuild(){
  diff run-builds.sh.tpl rpmbuild-$1/run-builds.sh 2>&1 > /dev/null || cp -f run-builds.sh.tpl rpmbuild-$1/run-builds.sh
  pushd rpmbuild-$1
  docker build -t "zepag/rpmbuild-$1" .
  popd
}

build_rpmbuild centos6
build_rpmbuild centos7
build_rpmbuild opensuse13.2
build_rpmbuild fedora21
