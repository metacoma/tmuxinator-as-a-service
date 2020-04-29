FROM openresty/openresty:1.15.8.3-1-alpine-fat
EXPOSE 80
RUN opm install 																\
	openresty/lua-resty-websocket=0.07						\
	thibaultcha/lua-resty-jit-uuid=0.0.7					\
	openresty/lua-resty-websocket=0.05   					\
	ledgetech/lua-resty-http=0.14	   							

RUN luarocks install router	
RUN luarocks install luasocket

ADD https://github.com/jpillora/chisel/releases/download/v1.4.0/chisel_1.4.0_linux_amd64.gz /tmp
WORKDIR /tmp
RUN gunzip -c chisel_1.4.0_linux_amd64.gz > /usr/local/bin/chisel
RUN chmod +x /usr/local/bin/chisel

ADD files/wssproxy/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
