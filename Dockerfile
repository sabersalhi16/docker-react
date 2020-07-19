FROM node:10-alpine as builder

WORKDIR "/graphql_front"

COPY package.json .
RUN yarn
COPY . .
RUN yarn build

FROM nginx


COPY --from=builder /graphql_front/build  /usr/share/nginx/html