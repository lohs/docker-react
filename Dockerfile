#build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run phase, only copy over app/build
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
