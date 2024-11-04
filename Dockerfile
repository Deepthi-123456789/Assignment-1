# Use the official Node.js image as a base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files, including api.js and axios.js
COPY . .

# Create the .env.local file with environment variables
RUN echo "NEXT_PUBLIC_API_BASE_URL=http://127.0.0.1:8000" >> .env.local

# Build the React application for production
RUN npm run build

# Install serve to serve the built app
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 3000

# Command to start the application
CMD ["serve", "-s", "build"]
