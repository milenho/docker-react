FROM node:14.15.0-alpine
WORKDIR '/app'
COPY package.json .
RUN npm cache verify
RUN npm install -g create-react-app
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html