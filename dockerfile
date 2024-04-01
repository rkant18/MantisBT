##########################version-V8.0 ########################
# Use an official PHP image as the base image
FROM php:8.0-apache

# Set environment variables
ENV MANTIS_VERSION 2.26.1
ENV MANTIS_URL https://downloads.sourceforge.net/project/mantisbt/mantis-stable/$MANTIS_VERSION/mantisbt-$MANTIS_VERSION.tar.gz
ENV MANTIS_HOME /var/www/html

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        unzip \
		    vim    \
		    htop   \
		    iputils-ping \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        && \
    rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd mysqli pdo_mysql zip

# Download and extract MantisBT
RUN wget -O mantisbt.tar.gz $MANTIS_URL && \
    tar -xzf mantisbt.tar.gz -C $MANTIS_HOME --strip-components=1 && \
    rm -f mantisbt.tar.gz

# Copy custom configuration files (if any)
# COPY config/config_inc.php $MANTIS_HOME/config/

# Set permissions
RUN chown -R www-data:www-data $MANTIS_HOME && \
    chmod -R 755 $MANTIS_HOME

# Expose port 80
EXPOSE 80

# Start Apache web server
CMD ["apache2-foreground"]
