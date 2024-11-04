# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE backend.settings  

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Run database migrations and create a superuser
RUN python manage.py makemigrations
RUN python manage.py migrate

# Create a superuser (optional; modify according to your needs)
RUN python manage.py create_superuser --noinput --username admin --email admin@admin.com

# Collect static files (if applicable)
RUN python manage.py collectstatic --noinput

# Expose the port that the app runs on
EXPOSE 8000

# Start the Django development server (or replace with your production server)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
