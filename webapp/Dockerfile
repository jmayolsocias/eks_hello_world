# Use the latest python3 alpine official image
FROM python:3.11.7-alpine3.19

# Set working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 8080

# Command to run on container start
CMD ["python3", "hello_world.py"]