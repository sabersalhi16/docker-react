FROM node:10-alpine

WORKDIR "/graphql_front"

COPY COPY package*.json ./
RUN yarn install
COPY ./ ./
RUN yarn build

#FROM nginx
#EXPOSE 80
#COPY --from=0 /graphql_front/build  /usr/share/nginx/html