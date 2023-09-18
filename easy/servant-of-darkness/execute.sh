docker run -d -p 12000:10000 -p 10001:10001 -p 10002:10002 mcr.microsoft.com/azure-storage/azurite

sudo -- sh -c "echo '127.0.0.1 devstoreaccount1.blob.core.windows.net' >> /etc/hosts"