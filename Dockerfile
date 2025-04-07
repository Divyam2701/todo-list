# Use Node.js base image
FROM node:18

# Install PM2 globally
RUN npm install -g pm2

# Set working directory
WORKDIR /app

# Copy dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build Vite app
RUN npm run build

# Expose frontend port
EXPOSE 3000

# Start app using PM2 serving the dist folder
CMD ["sh", "-c", "pm2 serve dist 3000 --spa --name to-do-list && pm2-runtime"]
