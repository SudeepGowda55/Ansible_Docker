FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl sudo
RUN apt-get install -y zip && apt-get install -y unzip
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN npm install -g http-server
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
EXPOSE 8080
CMD [ "http-server", "-p", "8080" ]


# docker build -t <tag-name> .

# docker container run -d --name <container-name> -p 8080:8080 <docker-image-name/docker-image-tag-name>