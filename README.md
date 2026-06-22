# Frontend Despacho – DevOps P3

Aplicación frontend desarrollada con **React + Vite** para la gestión de despachos.  
Forma parte del proyecto DevOps P3 y consume las APIs de los servicios backend de Ventas y Despachos.

## Requisitos

- Node.js 18+
- npm

## Ejecución en entorno local

```bash
npm install
npm run dev
```

Por defecto Vite levanta el frontend en un puerto similar a `http://localhost:5173`.

## Variables de entorno

El frontend consume la API a través de una variable de entorno (ejemplo):

- `VITE_API_URL` → URL base del backend (por ejemplo `http://localhost:8080` o la IP/URL del backend en AWS/EKS).

Esta variable se define antes de construir la aplicación, por ejemplo en un archivo `.env` o en la configuración del contenedor.

## Build para producción

```bash
npm run build
```

El resultado queda en la carpeta `dist/`.

## Imagen Docker

El proyecto incluye un `Dockerfile` para construir la imagen del frontend:

```bash
docker build -t devops-p3-frontend .
docker run -d -p 80:80 devops-p3-frontend
```

- Dentro del contenedor, el frontend se sirve en el **puerto 80**.
- Desde el navegador, el usuario accede a la IP/URL del contenedor o del servicio en AWS/EKS.

## Relación con los backends

- El frontend consume los endpoints expuestos por los backends:
  - Backend Ventas (puerto 8080)
  - Backend Despachos (puerto 8081)

La URL exacta del backend se configura mediante la variable `VITE_API_URL` según el entorno (local, Docker, EKS).