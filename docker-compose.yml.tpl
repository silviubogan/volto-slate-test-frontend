version: '3'

services:
  frontend:
    image: eeacms/<%= name %>
    ports:
    - "${FRONTEND:-4000}:4000"
    depends_on:
    - backend
    environment:
      PORT: "${FRONTEND:-4000}"
      API_PATH: "http://localhost:${BACKEND:-8080}/Plone"
      INTERNAL_API_PATH: "http://backend:${BACKEND:-8080}/Plone"
      RAZZLE_API_PATH: "http://localhost:${BACKEND:-8080}/Plone"
      RAZZLE_INTERNAL_API_PATH: "http://backend:${BACKEND:-8080}/Plone"

  backend:
    image: eeacms/plonesaas
    ports:
    - "${BACKEND:-8080}:8080"
    environment:
      CORS_ALLOW_ORIGIN: "http://localhost:3000,http://localhost:${FRONTEND:-4000}"
      SITE: "Plone"
    volumes:
    - data:/data

volumes:
  data:
    driver: local
