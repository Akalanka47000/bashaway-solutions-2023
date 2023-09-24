docker run --name=seraphina -d alpine:3.14 sleep infinity

docker exec seraphina /bin/sh -c "echo \"$(cat /proc/sys/kernel/random/uuid)\" >> /home/potions.txt"

# Write your code here

docker volume create bashaway

docker commit seraphina seraphina

docker rm -f seraphina

docker run --name=seraphina -d -v bashaway:/twilight seraphina

docker run --name=isabella -d -v bashaway:/twilight seraphina