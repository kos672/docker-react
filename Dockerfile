# Build the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build"]

#Serve the app on the server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
