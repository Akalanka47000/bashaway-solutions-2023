if [ -z $1 ]; then
    echo "Please pass in a number as an argument to the script."
    exit 0
fi

factor $1 | awk '{for(i=2; i<=NF; i++) {printf("%s%s", sep, $i); sep=" x "}; printf("\n")}'