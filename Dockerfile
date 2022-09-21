FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl sudo
RUN apt-get install -y zip && apt-get install -y unzip
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN npm install -g http-server
ADD https://www.free-css.com/assets/files/free-css-templates/download/page282/leadmark.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip leadmark.zip
RUN cp -rvf leadmark/* .
RUN rm -rf leadmark leadmark.zip
EXPOSE 8080
CMD [ "http-server", "-p", "8080" ]

# docker build -t <tag-name> .

# docker container run -d --name <container-name> -p 8080:8080 <docker-image-name/docker-image-tag-name>