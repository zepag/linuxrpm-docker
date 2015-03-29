### Howto use this

Building the various containers:

```sh
$ sh build.sh
```

This builds containers containing the necessary tools for rpm build, and adds the entry point script: /BUILDS-RW/run-builds.sh

These containers are meant to have a BUILD structure mounted as a read-only volume in /BUILDS-RO/.
These containers are meant to have an output folder mounted as a read-write volume in /OUTPUT/.
The /BUILDS-RW/run-builds.sh script will copy all content of /BUILDS-RO/ in /BUILDS-RW/, run the specified builds, and then copy resulting binaries in /OUTPUT/.

This structure ensures that original build sources/data is unaffected, and that only output binaries will be extracted to the host.
Therefore, apart from the resulting binaries, each run of a container ensures a clean build.

A container build found in BUILDS/foobar should be run like this:
```sh
$ docker run -t -i -v $PWD/BUILDS:/BUILDS-RO/:ro -v $PWD/OUTPUT/:/OUTPUT/:rw zepag/rpmbuild-centos6 /BUILDS-RW/run-builds.sh "foobar"
```
