#!/bin/sh

desc="start running ${0}.........."

dir=`dirname $0`
. ${dir}/../misc.sh

expect EFAULT chmod NULL 0644
expect EFAULT chmod DEADCODE 0644
