# 1: build de la app
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# 2: servir estático con Nginx
FROM nginx:1.25-alpine

# El build de Vite suele salir en la carpeta dist
COPY --from=build /app/dist /usr/share/nginx/html

# Opcional: copiar config propia de nginx si la tienen
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
