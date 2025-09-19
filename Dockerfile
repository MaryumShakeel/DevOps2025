# FROM node:18-alpine

# WORKDIR /app

# COPY package*.json ./
# RUN npm install

# COPY . .

# # Build production files
# RUN npm run build

# EXPOSE 3000

# # Run preview server on 0.0.0.0 so browser se access ho sake
# CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]


# Use base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Expose port your app uses
EXPOSE 3000

# Start command
CMD ["npm", "run", "dev"]
