# Use official Node.js LTS image
FROM node:22-alpine

# Set working directory
WORKDIR /app

COPY package*.json ./

RUN npm install

# Copy the rest of the app files
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
