# Etap 1: Budowa aplikacji
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Etap 2: Serwowanie przez Nginx
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ```

3. Dodaj też plik **nginx.conf** (bo bez niego Nginx się wywali):

   - Nowy plik: `nginx.conf`  
   - Wklej:

```nginx
server {
    listen 80;
    server_name localhost;
