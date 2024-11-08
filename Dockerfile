# Use official Apache2 image
FROM httpd:2.4

# Copy the HTML page into the Apache container's default public directory
COPY index.html /usr/local/apache2/htdocs/

# Expose port 80 to be accessed from outside the container
EXPOSE 80
