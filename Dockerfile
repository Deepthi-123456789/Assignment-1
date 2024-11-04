# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy only the package.json and package-lock.json (or yarn.lock) for caching dependencies
COPY frontend/package*.json ./frontend/

# Install dependencies in the frontend directory
RUN cd frontend && npm install

# Copy the rest of the application files to the working directory
COPY frontend ./frontend

# Debug: Verify that the pages directory exists in /app/frontend
RUN ls -R /app/frontend

# Set environment variable
RUN echo "NEXT_PUBLIC_API_BASE_URL=http://127.0.0.1:8000" > /app/frontend/.env.local

# Build the Next.js application
RUN cd frontend && npm run build

# Expose the port that the application will run on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "run", "dev", "--prefix", "frontend"]
