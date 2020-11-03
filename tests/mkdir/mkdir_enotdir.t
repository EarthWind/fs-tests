#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755
expect 0 create ${n0}/${n1} 0644
expect ENOTDIR mkdir ${n0}/${n1}/test 0755
expect 0 unlink ${n0}/${n1}
expect 0 rmdir ${n0}
