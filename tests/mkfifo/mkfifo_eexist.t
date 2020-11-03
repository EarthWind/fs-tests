#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`

expect 0 mkdir ${n0} 0755
expect EEXIST mkfifo ${n0} 0644
expect 0 rmdir ${n0}

expect 0 create ${n0} 0644
expect EEXIST mkfifo ${n0} 0644
expect 0 unlink ${n0}

expect 0 symlink test ${n0}
expect EEXIST mkfifo ${n0} 0644
expect 0 unlink ${n0}

expect 0 mkfifo ${n0} 0644
expect EEXIST mkfifo ${n0} 0644
expect 0 unlink ${n0}
