FROM node:10-alpine as builder

WORKDIR "/graphql_front"

COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /graphql_front/build  /usr/share/nginx/html