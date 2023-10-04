docker run -d --rm -it -p 3000:80 -p 2525:25 -p 1636:143 rnwood/smtp4dev:v3

sleep 10

node email.js