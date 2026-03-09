# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app

# Define Build Arguments
# This allows Docker to pass variables from your .env/docker-compose into the build process
ARG VITE_API_URL

# Set them as Environment Variables for the build command
ENV VITE_API_URL=$VITE_API_URL

COPY package*.json ./
RUN npm install
COPY . .

# Now when this runs, Vite will find VITE_API_URL and bake it into the code
RUN npm run build

# Stage 2: Serve
FROM nginx:alpine

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

RUN mkdir -p /var/cache/nginx/client_temp \
             /var/cache/nginx/proxy_temp \
             /var/cache/nginx/fastcgi_temp \
             /var/cache/nginx/uwsgi_temp \
             /var/cache/nginx/scgi_temp && \
    chown -R appuser:appgroup /var/cache/nginx && \
    chown -R appuser:appgroup /var/log/nginx && \
    chown -R appuser:appgroup /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown -R appuser:appgroup /var/run/nginx.pid

COPY --from=builder /app/dist /usr/share/nginx/html
RUN chown -R appuser:appgroup /usr/share/nginx/html

RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD [ -f /usr/share/nginx/html/index.html ] || exit 1

USER appuser
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
