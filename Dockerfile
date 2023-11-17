# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list
RUN apt-get update && apt-get upgrade -y

# Install necessary dependencies and packages
RUN apt-get install -y python3.10 python3-pip
RUN pip install --upgrade pip

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./app.py /app/app.py
#COPY ./requirements.txt /app/requirements.txt

# Upgrade pip and install Python packages
#RUN pip install -r requirements.txt --default-timeout=100 future
RUN pip install gradio ctransformers
# Set the environment variable for the model path on the host server
ENV MODEL_PATH /app/data

# Make port 7860 available to the world outside this container
EXPOSE 7860

# Create a volume mount point
VOLUME ["/app/data"]

# Run app.py when the container launches
CMD python3 -u app.py