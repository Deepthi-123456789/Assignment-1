# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package*.json ./

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package-lock*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Set environment variables for the Next.js application
# Create .env.local file and set NEXT_PUBLIC_API_BASE_URL
RUN echo "NEXT_PUBLIC_API_BASE_URL=http://127.0.0.1:8000" > frontend/.env.local

# Build the Next.js application
RUN npm run build

# Expose the port that the application will run on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "run", "dev"]
