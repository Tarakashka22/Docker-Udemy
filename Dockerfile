#Tag this phase with a name. In this case as builder
FROM node:16-alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#No need to specify CMD as "run nginx" is a default command for nginx image
