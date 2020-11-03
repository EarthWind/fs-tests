#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT mkdir NULL 0755
expect EFAULT mkdir DEADCODE 0755
