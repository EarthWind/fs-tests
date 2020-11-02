#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

expect 0 mkdir ${name255} 0755
expect 0 mkdir ${name255}/${name255} 0755
expect 0 mkdir ${name255}/${name255}/${name255} 0755
expect 0 mkdir ${path1021} 0755
expect 0 create ${path1023} 0644
expect 0 chmod ${path1023} 0642
expect 0 unlink ${path1023}
create_too_long
expect ENAMETOOLONG chmod ${too_long} 0642
unlink_too_long
expect 0 rmdir ${path1021}
expect 0 rmdir ${name255}/${name255}/${name255}
expect 0 rmdir ${name255}/${name255}
expect 0 rmdir ${name255}
