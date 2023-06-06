# Use the official Node.js image as the base
FROM node:alpine

# Set the working directory inside the container
WORKDIR /src

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the React app
RUN npm run build

# Expose port 3000 for the React frontend
EXPOSE 3000

# Serve the built React app
CMD ["npx", "serve", "-s", "build"]
