#!/bin/sh

desc="unlink returns EPERM if the named file is a directory"

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`

expect 0 mkdir ${n0} 0755
expect EISDIR unlink ${n0}
expect 0 rmdir ${n0}
