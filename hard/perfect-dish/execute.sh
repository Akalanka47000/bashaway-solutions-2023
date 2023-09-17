## Start Install Google Chrome (This is required for testing. You may comment out these lines during local development if you already have Chrome installed)

sudo apt update

sudo apt upgrade

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt-get install -f

## End Install Google Chrome

# Write your code here

docker build -t perfect-dish ./src

docker run -d -p 8001:8000 --name bashaway-2k23-perfect-dish perfect-dish 