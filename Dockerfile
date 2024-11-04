# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy only the package.json and package-lock.json (or yarn.lock) for caching dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Ensure the frontend directory exists and create the .env.local file
RUN mkdir -p frontend && echo "NEXT_PUBLIC_API_BASE_URL=http://127.0.0.1:8000" > Assignment-1/.env.local

# Debug: List contents to verify files were copied correctly
RUN ls -R /app

# Build the Next.js application
RUN npm run build

# Expose the port that the application will run on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "run", "dev"]
