eval set -- "$(getopt -n "$0" -l "keys:,script:" -- -- "$@")"

while [ $# -gt 0 ]
do
     case "$1" in
          --keys) keys="$2"; shift;;
          --script) script="$2"; shift;;
     esac
     shift;
done

if [ -z "$keys" ] || [ -z "$script" ]; then
    echo "No keys or script provided. Exiting...";
    exit 0;
fi

execute=true;

for key in $keys
do
    if [ -z "${!key}" ]; then
        execute=false;
    fi
done

if $execute; then
    bash "$script";
else
    echo "Access Denied";
fi