#!/bin/sh

desc="mkfifo returns EFAULT if the path argument points outside the process's allocated address space"

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT mkfifo NULL 0644
expect EFAULT mkfifo DEADCODE 0644
