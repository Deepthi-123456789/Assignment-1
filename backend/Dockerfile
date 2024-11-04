# Use the official Python image as the base image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=your_app.settings  

# Set the working directory
WORKDIR /app

# Copy the requirements.txt first to leverage Docker cache
COPY backend/requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire backend application files to the working directory
COPY backend/ .

# Create a .env file and set environment variables
RUN echo "FRONTEND_URL=http://127.0.0.1:3000" >> .env
RUN echo "BACKEND_URL=http://127.0.0.1:8000" >> .env
RUN echo "BE_ADMIN_EMAIL=admin@admin.com" >> .env
RUN echo "BE_ADMIN_PASSWORD=admin" >> .env
RUN echo "DJANGO_SECRET_KEY=your_secret_key_here" >> .env
# Add OpenAI settings for Azure (adjust as necessary)
RUN echo "OPENAI_API_TYPE=azure" >> .env
RUN echo "OPENAI_API_BASE=your_azure_endpoint" >> .env
RUN echo "OPENAI_API_VERSION=your_azure_api_version" >> .env
RUN echo "OPENAI_API_KEY=your_azure_api_key" >> .env

# Run database migrations and create a superuser
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser --noinput --username admin --email admin@admin.com
RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_user('assistant', '', 'assistant')" | python manage.py shell
RUN python manage.py collectstatic --noinput

# Expose the port for the Django app
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
