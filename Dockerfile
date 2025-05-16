# Use official PHP Apache base image
FROM php:8.1-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Suppress Apache ServerName warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy project files
COPY . /var/www/html/

# Set proper permissions (optional but recommended)
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 80
