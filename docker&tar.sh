

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt



### Docker Networking ###
docker network ls 
docker network inspect <NETWORKNAME>


#### Only for Container ####
docker container start <CONTAINERNAME>
docker container ls

#Save container to new Image
docker commit <RUNNINGCONTAINER> <NEWIMAGE>
docker inspect <CONTAINERNAME>
docker export -o <FILENAME.tar> <CONTAINERNAME> ##goes with import to load files

docker exec -it <CONTAINERNAME> /bin/bash
## Start dummy container and volume references from another cotainer
docker run --volumes-from <CONTAINERNAME1-some-nginx> --name <CONTAINERNAME2-backup> -it ubuntu bash


#### Only for Images #####
docker run -it <IMAGENAME> -p 8080:8080
docker run -it --rm --name certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" -p 80:80 certbot/certbot certonly
docker run -it --rm --name some_certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" -p 80:80 certbot/certbot certonly
docker run -it --rm --name santanderapp_service -p 8080:8080 santanderapp

docker image load -i <FILENAME.tar>
docker image save -o <FILENAME.tar>  <IMAGENAME> 
docker build -t <IMAGENAME> .

###Docker Volumes
docker volume ls
docker volume <VOLUMENAME> inspect


###Tar commands
#create tar to exlcude parent directory
tar -C nginx-dev-ssl -cf nginx-dev-ssl1.tar *
tar -cf nginx-dev-ssl1.tar * -C nginx-dev-ssl

# create tar to include parent directory
tar -cf nginx-dev-ssl.tar nginx-dev-ssl 

#Extract tar into directory
tar -xf nginx-dev-ssl.tar -C nginx-dev-ssl


### Kubernetes commands kubectl For current cluster
#Return all resources in all spaces for current cluster
kubectl get all --all-namespaces 

#Delete Deployment
kubectl delete deployment <deployment_name> -n <namespace_name>
#Delete Service
kubectl delete service <service_name> -n <namespace_name>

