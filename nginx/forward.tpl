server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;
    error_log  /var/log/%web_system%/domains/%domain%.error.log error;

    location / {
        proxy_pass      http://FORWARDTO;
    }

    include %home%/%user%/conf/web/nginx.%domain%.conf*;
}

