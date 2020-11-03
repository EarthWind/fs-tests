#!/bin/sh

desc="start running ${0}.........."
echo $desc

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT chown NULL 65534 65534
expect EFAULT chown DEADCODE 65534 65534
