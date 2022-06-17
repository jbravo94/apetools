# syntax=docker/dockerfile:1
FROM node:12.22.12-buster
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build

FROM httpd:2.4.48  
COPY --from=0 /app/docs/ /usr/local/apache2/htdocs/
