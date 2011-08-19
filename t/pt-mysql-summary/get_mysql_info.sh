#!/bin/bash

TESTS=3

TEST_NAME="get_mysql_timezone"
cp samples/mysql-variables-001.txt /tmp/percona-toolkit-mysql-variables
is $(get_mysql_timezone) "EDT"

TEST_NAME="get_mysql_uptime"
cat <<EOF > $TMPDIR/expected
2010-05-27 11:38 (up 0+02:08:52)
EOF
cp samples/mysql-status-001.txt /tmp/percona-toolkit-mysql-status
echo "2010-05-27 11:38" > $TMPDIR/in
get_mysql_uptime $TMPDIR/in > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected

TEST_NAME="get_mysql_version"
cat <<EOF > $TMPDIR/expected
             Version | 5.0.51a-24+lenny2 (Debian)
            Built On | debian-linux-gnu i486
EOF
cp samples/mysql-variables-001.txt /tmp/percona-toolkit-mysql-variables
get_mysql_version > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected