if [ ! -d "./src" ]; then
  echo "No data to convert. Exiting..."
  exit 0
fi

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq && sudo chmod +x /usr/bin/yq

file=$(basename -- $(find src -name "*.xml") .xml)

rm -rf out && mkdir -p out

yq --input-format xml --output-format json ./src/$file.xml >> out/$file.json