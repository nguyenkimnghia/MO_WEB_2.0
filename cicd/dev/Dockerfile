FROM k8sdev.mbbank.com.vn/support/nginx:1.21.4

COPY /build/web /usr/share/nginx/html
COPY cicd/dev/nginx-custom.conf /etc/nginx/conf.d/default.conf

# expose port 10911 
EXPOSE 10842
