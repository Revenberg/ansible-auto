sudo apt-get update
sudo apt-get install nginx
sudo service nginx start
sudo vi /etc/nginx/sites-enabled/default
##### VI output, oder nano jenachdem mit was du die ändern willst ###
 
server {
        #listen   80; ## listen for ipv4; this line is default and implied
        #listen   [::]:80 default_server ipv6only=on; ## listen for ipv6
 
        root /usr/share/nginx/www;
        index index.html index.htm;
 
        # Make site accessible from http://localhost/
        server_name localhost;
 
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                #       try_files $uri $uri/ /index.html;
                # Uncomment to enable naxsi on this location
                # include /etc/nginx/naxsi.rules
                proxy_pass http://localhost:6680;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
        }
 
 
#######
sudo service nginx restart

#########
proxy pass airpi.local:80 -> airpi.local:6680 eingerichtet
 
Websocket im interface auf folgendes ändern .. abhängig von der ip deines pi's . ipv6 namen funktionieren auch
jedoch nicht auf android geräten so wie ich das gerade sehe - also doch IP verwenden
ws://airpi.local:6680/mopidy/ws/

