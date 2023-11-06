# Use a Linux image
FROM ubuntu:22.04

# Install MySQL
RUN apt-get update && \
    apt-get install -y mysql-server

# Install .NET
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh && \
    ./dotnet-install.sh --version latest && \
    apt-get install -y dotnet-sdk-6.0

RUN dotnet tool install --global dotnet-ef

# Install MongoDB
RUN apt-get update && \
    apt-get install -y gnupg curl && \
    curl -fsSL https://pgp.mongodb.com/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Set up Python
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --upgrade pip

# Create DB directory for MongoDB
RUN mkdir -p /data/db

# Copy all files in the current directory recursively to the container
COPY . /app

# Set the working directory to /app
WORKDIR /app

# Expose ports for MySQL and MongoDB
EXPOSE 3306
EXPOSE 27017
