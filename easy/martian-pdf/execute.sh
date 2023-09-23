# A pdf file will be generated within a src directory once the tests are run.

# Write your code here

if [ ! -d "src" ]; then
  echo "No pdf file found"
  exit 0
fi

sudo apt-get -qq install poppler-utils

pdftotext src/mystery.pdf -f $1 -l $1 - | wc -w