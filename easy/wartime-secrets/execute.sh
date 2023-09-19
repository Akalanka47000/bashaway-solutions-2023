if (( ${#1} < 8 )); then
    echo false
    exit 0
elif [[ $1 != *[[:digit:]]* ]]; then
    echo false
    exit 0
elif [[ $1 != *[[:lower:]]* ]]; then
    echo false
    exit 0
elif [[ $1 != *[[:upper:]]* ]]; then
    echo false
    exit 0
fi

echo true