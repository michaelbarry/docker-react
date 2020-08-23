# build phase
FROM node:alpine as builder
WORKDIR  '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build contains the build
# run phase

# this statement identifies the previous phase ended
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

