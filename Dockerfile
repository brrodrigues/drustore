FROM node:alpine as my-app
WORKDIR /app
COPY . .

RUN npm ci && npm run build

FROM nginx:alpine
COPY --from=my-app /app/dist/drustore /usr/share/nginx.html
COPY --from=my-app /app/configuration/nginx.conf /usr/nginx.conf
EXPOSE 10000
