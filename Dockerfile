FROM node:10-alpine

COPY COPY package*.json ./
RUN yarn 
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=0 /graphql_front/build  /usr/share/nginx/html

#FROM alpine:latest
#RUN apk add -U git
