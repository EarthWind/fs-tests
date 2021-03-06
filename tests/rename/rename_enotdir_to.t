#!/bin/sh

desc="rename returns ENOTDIR when the 'from' argument is a directory, but 'to' is not a directory"

dir=`dirname $0`
. ${dir}/../misc.sh

n0=`namegen`
n1=`namegen`

expect 0 mkdir ${n0} 0755

expect 0 create ${n1} 0644
expect ENOTDIR rename ${n0} ${n1}
expect dir lstat ${n0} type
expect regular lstat ${n1} type
expect 0 unlink ${n1}

expect 0 mkfifo ${n1} 0644
expect ENOTDIR rename ${n0} ${n1}
expect dir lstat ${n0} type
expect fifo lstat ${n1} type
expect 0 unlink ${n1}

expect 0 symlink test ${n1}
expect ENOTDIR rename ${n0} ${n1}
expect dir lstat ${n0} type
expect symlink lstat ${n1} type
expect 0 unlink ${n1}

expect 0 rmdir ${n0}
