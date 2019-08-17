#!/bin/sh

set -eu

JMETER=${JMETER:-/opt/jmeter/bin/jmeter}
SCRIPT_NAME=`basename $0`

if [ $# -ne 2 ]
then
    cat 1>&2 <<EOF
${SCRIPT_NAME} <testplan> <output_directory>

EOF
    exit 1
fi

testplan=$1
output_directory=$2

if [ -d "${output_directory}" ]
then
    echo "${output_directory} already exists. Will wipe it clean in 5 seconds."
    echo "Press Ctrl-C to abort"
    sleep 5
    rm -rf "${output_directory}"
fi

echo "Commencing test plan execution..."
mkdir -p "${output_directory}"
${JMETER} -n -t "${testplan}" -l "${output_directory}/results" -j "${output_directory}/log" -e -o "${output_directory}/report"
