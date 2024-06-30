# Use an official Nginx runtime as a parent image
FROM nginx:alpine

# Copy static website files to the Nginx server directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# No need to specify CMD, as the default command for the nginx:alpine image is to run Nginx
