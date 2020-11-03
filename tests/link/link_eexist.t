#!/bin/sh

desc="start running ${0}.........."
echo $desc

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`

expect 0 create ${n0} 0644

expect 0 create ${n1} 0644
expect EEXIST link ${n0} ${n1}
expect 0 unlink ${n1}

expect 0 mkdir ${n1} 0755
expect EEXIST link ${n0} ${n1}
expect 0 rmdir ${n1}

expect 0 symlink test ${n1}
expect EEXIST link ${n0} ${n1}
expect 0 unlink ${n1}

expect 0 mkfifo ${n1} 0644
expect EEXIST link ${n0} ${n1}
expect 0 unlink ${n1}

expect 0 unlink ${n0}
