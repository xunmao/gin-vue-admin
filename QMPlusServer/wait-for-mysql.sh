#!/bin/sh
set -e

host="$1"
shift
user="$1"
shift
password="$1"
shift
delay="$1"
shift

until mysql --host="$host" --user="$user" --password="$password" --execute="quit"; do
    echo "MySQL is unavailable - sleeping $delay s"
    sleep $delay
done

cmd="$@"

echo "MySQL is up - executing command"
exec $cmd
