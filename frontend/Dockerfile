# =========================================================================
# Dockerfile frontend — dev mode (Vite avec hot reload)
# =========================================================================
FROM node:20-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 5173
# --host 0.0.0.0 : accessible depuis l'extérieur du conteneur
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
