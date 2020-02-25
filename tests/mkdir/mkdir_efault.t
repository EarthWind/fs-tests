#!/bin/sh

desc="mkdir returns EFAULT if the path argument points outside the process's allocated address space"

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT mkdir NULL 0755
expect EFAULT mkdir DEADCODE 0755
