#FROM glitchtip/glitchtip:latest

# Use an official Python runtime as a parent image
FROM python:3.11

# Set environment variables
ENV SECRET_KEY="Enter a random string of characters"
ENV EMAIL_URL=""
ENV DEFAULT_FROM_EMAIL=""
ENV GLITCHTIP_DOMAIN=""
ENV DATABASE_URL=""
ENV REDIS_URL=""

# Set the working directory in the container
WORKDIR /app

# Clone the Git repository
RUN apt-get update && apt-get install -y git
RUN git clone -b master https://gitlab.com/glitchtip/glitchtip.git .

# Copy the Django project files into the container
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

