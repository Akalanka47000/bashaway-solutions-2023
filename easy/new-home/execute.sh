docker pull mongo:latest

if [ ! "$(docker ps -a | grep bashaway-2k23-sunset)" ]; then
    docker run -d --name bashaway-2k23-sunset -p 27207:27017 mongo # Data will be populated into this instance once the tests are run.
fi

if [ ! "$(docker ps -a | grep bashaway-2k23-sunrise)" ]; then
    docker run -d --name bashaway-2k23-sunrise -p 27208:27017 mongo # Target instance to migrate data to.
fi

# Write your code here

rm -rf dump

mongodump "mongodb://localhost:27207/?directConnection=true"

mongorestore "mongodb://localhost:27208/?directConnection=true" dump

rm -rf dump