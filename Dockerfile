FROM node:latest 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build 

FROM nginx:latest
COPY --from=build /app/dist/angularcicd /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
