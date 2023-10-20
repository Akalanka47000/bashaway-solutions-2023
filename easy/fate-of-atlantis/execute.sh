if [ -z $1] ; then
    echo "Usage: ./execute.sh <search term>"
    exit 0
fi

grep $1 src/logs.txt