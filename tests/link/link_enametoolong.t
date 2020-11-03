#!/bin/sh

desc="start running ${0}.........."
echo $desc

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`

expect 0 create ${name255} 0644
expect 0 link ${name255} ${n0}
expect 0 unlink ${name255}
expect 0 link ${n0} ${name255}
expect 0 unlink ${n0}
expect 0 unlink ${name255}

expect 0 create ${n0} 0644
expect ENAMETOOLONG link ${n0} ${name256}
expect 0 unlink ${n0}
expect ENAMETOOLONG link ${name256} ${n0}
