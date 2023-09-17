sudo apt-get update

sudo apt-get install imagemagick

if [ ! -d "src" ]; then
  echo "No images to resize"
  exit 0
fi

mkdir -p dist && for file in src/*.jpg; do mogrify -path dist -resize 400% "$file"; done