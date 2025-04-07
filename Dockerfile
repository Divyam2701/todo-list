# Stage 1: Build the Vite app
FROM node:18-alpine as builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve using PM2
FROM node:18-alpine

WORKDIR /app

# Install global dependencies
RUN npm install -g pm2 serve

COPY --from=builder /app/dist ./dist
COPY ecosystem.config.js .

EXPOSE 3000

# Use pm2-runtime to keep container alive
CMD ["pm2-runtime", "ecosystem.config.js"]
