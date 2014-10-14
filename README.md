
#Docker appserver.io for Magento

##Usage:
###Clone the repo <br />
```git clone https://github.com/DavidFeller/docker-magento-appserver.git```

### Build the image
```docker build -t <image-name> . ```

### Run as a container:
```docker run -d --name <servername>  
  -p 9080:9080 
  -v <local_document_root>:/opt/appserver/webapps/magento 
  --link <mysql_container>:mysql 
  --link <redis-container>:redis 
  <image-name>```

