#!/bin/bash


echo "Pulling the latest Docker image..."
docker pull gyan777/word_to_pdf:latest


echo "Stopping and removing any existing container..."
docker stop word_to_pdf || true
docker rm word_to_pdf || true


echo "Starting the Docker container..."
docker run -d -p 5000:5000 --name word_to_pdf gyan777/word_to_pdf:latest

echo "Container is running at http://localhost:5000"
