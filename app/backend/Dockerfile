FROM node:20-alpine

# FIX: Install curl so the healthcheck actually works
RUN apk add --no-cache curl

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Ensure appuser owns the app directory
RUN chown -R appuser:appgroup /app

USER appuser
EXPOSE 5000

# Healthcheck now has 'curl' available
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:5000/health || exit 1

CMD ["node", "src/server.js"]
