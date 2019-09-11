FROM node:alpine as builder
WORKDIR /app
COPY ./ /app
RUN npm install
RUN npm build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

