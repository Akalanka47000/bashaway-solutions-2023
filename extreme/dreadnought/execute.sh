docker compose down || true

docker compose up -d

npm install -g pm2

pm2 stop producer || true

pm2 start execute.js --name producer