#!/bin/bash
error(){
  echo "$1"
  exit 1
}

[ -d "/BUILDS-RO/" ] || error "/BUILDS-RO/ folder missing. Cannot build. This should be run in a pre-configured docker container."
mkdir -p /BUILDS-RW/
cp -fR /BUILDS-RO/* /BUILDS-RW/
for example in $@
do
  sh /BUILDS-RW/launch-build.sh ${example}
  echo "-----------------------------------------------------------------------------"
  echo "  Scanning for resulting RPM files."
  echo "-----------------------------------------------------------------------------"
  for rpm in $(find /BUILDS-RW/${example} -type f -name "*.rpm")
  do
    echo "Found rpm: ${rpm}"
    mkdir -p /OUTPUT/
    mv ${rpm} /OUTPUT/
  done
done
