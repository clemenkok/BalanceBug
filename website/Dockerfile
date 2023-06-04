# Use the official Node.js image as the base
FROM node:alpine

# Set the working directory inside the container
WORKDIR /.

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port on which the Node.js application listens
EXPOSE 8080

# Start the Node.js application
CMD ["npm", "start"]
