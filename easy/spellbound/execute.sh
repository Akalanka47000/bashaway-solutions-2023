sudo apt-get install jq

if [ ! -f src/grimoire.json ]; then
    echo "No data to parse. Exiting..."
    exit 0
fi

echo $(cat src/grimoire.json | jq '[.[].name] | to_entries | .[] | select(.value=="bashaway") | .key')