#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

expect 0 create ${name255} 0644
expect 0 chmod ${name255} 0620
expect 0620 stat ${name255} mode
expect 0 unlink ${name255}
expect ENAMETOOLONG chmod ${name256} 0620
