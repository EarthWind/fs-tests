#!/bin/sh

desc="mkfifo returns ENAMETOOLONG if a component of a pathname exceeded 255 characters"

dir=`dirname $0`
. ${dir}/../misc.sh

expect 0 mkfifo ${name255} 0644
expect 0 unlink ${name255}
expect ENAMETOOLONG mkfifo ${name256} 0644
