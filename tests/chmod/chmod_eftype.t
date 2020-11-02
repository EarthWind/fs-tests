#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755
cdir=`pwd`
cd ${n0}

expect 0 mkdir ${n1} 0755
expect 0 chmod ${n1} 01755
expect 01755 stat ${n1} mode
expect 0 rmdir ${n1}

expect 0 create ${n1} 0644
expect 0 chmod ${n1} 01644
expect 01644 stat ${n1} mode
expect 0 unlink ${n1}

expect 0 mkdir ${n1} 0755
expect 0 chown ${n1} 65534 65534
expect 0 -u 65534 -g 65534 chmod ${n1} 01755
expect 01755 stat ${n1} mode
expect 0 rmdir ${n1}

expect 0 create ${n1} 0644
expect 0 chown ${n1} 65534 65534
expect 0 -u 65534 -g 65534 chmod ${n1} 01644
expect 01644 stat ${n1} mode
expect 0 unlink ${n1}

cd ${cdir}
expect 0 rmdir ${n0}
