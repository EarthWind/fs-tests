#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT open NULL O_RDONLY
expect EFAULT open DEADCODE O_RDONLY
