FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Copy local node_modules (optional: if you already installed locally)
COPY node_modules ./node_modules

# Copy all project files
COPY . .

# Install dependencies (will use existing node_modules if copied)
RUN npm install

# Expose port your app uses
EXPOSE 3000

# Start command
CMD ["npm", "run", "dev"]
