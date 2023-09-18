sudo apt-get update

sudo apt-get install imagemagick

if [ ! -d "src" ]; then
  echo "No images to resize"
  exit 0
fi

mkdir -p out && for file in src/*.jpg; do mogrify -path out -resize 400% "$file"; done