#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT mkfifo NULL 0644
expect EFAULT mkfifo DEADCODE 0644
