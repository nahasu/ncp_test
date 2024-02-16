FROM httpd

cat <<EOF >> /usr/local/apache2/conf/httpd.conf
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so

Include conf/extra/httpd-vhosts.conf
EOF

cat <<EOF >> /usr/local/apache2/conf/extra/httpd-vhosts.conf
<VirtualHost *:80>
    ServerName localhost

    ProxyRequests Off
    ProxyPreserveHost On

    ProxyPass /test1.html http://192.168.1.200:8080/
    ProxyPassReverse /index.html http://192.168.1.200:8080/
</VirtualHost>
EOF


EXPOSE 80

CMD ["httpd-foreground"]
