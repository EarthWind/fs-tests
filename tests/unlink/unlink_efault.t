#!/bin/sh

desc="unlink returns EFAULT if the path argument points outside the process's allocated address space"

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT unlink NULL
expect EFAULT unlink DEADCODE
