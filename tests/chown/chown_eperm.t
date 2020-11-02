#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`
n2=`namegen`

expect 0 mkdir ${n0} 0755
cdir=`pwd`
cd ${n0}
expect 0 mkdir ${n1} 0755
expect 0 chown ${n1} 65534 65534
expect 0 -u 65534 -g 65534 create ${n1}/${n2} 0644
expect EPERM -u 65534 -g 65534 chown ${n1}/${n2} 65533 65533
expect EPERM -u 65533 -g 65533 chown ${n1}/${n2} 65534 65534
expect EPERM -u 65533 -g 65533 chown ${n1}/${n2} 65533 65533
expect EPERM -u 65534 -g 65534 -- chown ${n1}/${n2} -1 65533
expect 0 unlink ${n1}/${n2}
expect 0 rmdir ${n1}
cd ${cdir}
expect 0 rmdir ${n0}
