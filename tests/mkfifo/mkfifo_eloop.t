#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`

expect 0 symlink ${n0} ${n1}
expect 0 symlink ${n1} ${n0}
expect ELOOP mkfifo ${n0}/test 0644
expect ELOOP mkfifo ${n1}/test 0644
expect 0 unlink ${n0}
expect 0 unlink ${n1}
