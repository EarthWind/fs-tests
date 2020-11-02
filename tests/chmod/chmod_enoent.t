#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755
expect ENOENT chmod ${n0}/${n1}/test 0644
expect ENOENT chmod ${n0}/${n1} 0644
expect 0 rmdir ${n0}
