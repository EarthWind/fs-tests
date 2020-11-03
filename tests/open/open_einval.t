#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`

expect 0 create ${n0} 0644
case "${os}" in
Linux)
	expect 0 open ${n0} O_WRONLY,O_RDWR
	expect 0 open ${n0} O_RDONLY,O_WRONLY,O_RDWR
        ;;
*)
	expect EINVAL open ${n0} O_WRONLY,O_RDWR
	expect EINVAL open ${n0} O_RDONLY,O_WRONLY,O_RDWR
        ;;
esac
expect 0 unlink ${n0}
