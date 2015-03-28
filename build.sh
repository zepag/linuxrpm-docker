#!/bin/bash
build_rpmbuild(){
  cp -f run-builds.sh rpmbuild-$1/
  pushd rpmbuild-$1
  docker build -t "zepag/rpmbuild-$1" .
  popd
}

build_rpmbuild centos6
build_rpmbuild centos7
