# Use Node.js base image
FROM node:18

# Install PM2 globally
RUN npm install -g pm2

# Set working directory
WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of the app
COPY . .

# Build the Vite app
RUN npm run build

# Expose the port Vite app will run on
EXPOSE 3000

# Serve the app with PM2
CMD ["pm2-runtime", "serve", "dist", "3000", "--spa", "--name", "to-do-list"]
