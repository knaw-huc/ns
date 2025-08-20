FROM alpine:latest

COPY . /usr/local/src/

RUN apk update &&\
    apk add runit nginx &&\
    apk add --virtual=build-dependencies python3 py3-rdflib make &&\
    apk upgrade -a &&\
    rm /etc/nginx/http.d/default* &&\
    sed -i 's/txt;/txt log md;/' /etc/nginx/mime.types &&\
    sed -i "s/}/\tapplication\/ld+json\tjsonld;\n\tapplication\/n-quads\tnq;\ttext\/turtle\tttl;\n}/" /etc/nginx/mime.types &&\
    mkdir -p /etc/service/nginx &&\
    cd /usr/local/src &&\ 
    cp etc/nginx/nginx.conf /etc/nginx/nginx.conf &&\
    cp etc/nginx/http.d/ns.conf /etc/nginx/http.d/ns.conf &&\
    make deps &&\
    make all &&\
    cp *json* *nq *md *html /var/www/localhost/htdocs/ &&\
    cd - &&\
    apk del build-dependencies &&\
    rm -rf /usr/local/src

#nginx
EXPOSE 80

COPY etc/service/nginx/run /etc/service/nginx/run
COPY etc/nginx/http.d/ns.conf /etc/nginx/http.d/ns.conf

ENTRYPOINT ["runsvdir","-P","/etc/service"]
