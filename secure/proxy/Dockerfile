FROM markvnext/nginx-luarocks

# Install luarocks modules
RUN luarocks install luacrypto
RUN luarocks install lbase64

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./hmac_access.lua /etc/nginx/hmac_access.lua