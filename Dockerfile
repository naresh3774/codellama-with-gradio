# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster as builder

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install required Python packages
RUN ulimit -s 65535
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --default-timeout=100 future

# Make port 7861 available to the world outside this container
EXPOSE 7861

# Define environment variable
ENV NAME World

# Create a volume mount point
VOLUME ["/app/data"]

# Run app.py when the container launches
CMD ["python", "app.py"]