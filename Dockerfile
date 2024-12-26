FROM ubuntu:20.04

# Set environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

# Install Apache
RUN apt-get update && apt-get install -y apache2

# Create a simple index.html file
RUN echo 'Hello, Docker!' > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
