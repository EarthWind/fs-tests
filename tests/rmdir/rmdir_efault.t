#!/bin/sh

desc="rmdir returns EFAULT if the path argument points outside the process's allocated address space"

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT rmdir NULL
expect EFAULT rmdir DEADCODE
