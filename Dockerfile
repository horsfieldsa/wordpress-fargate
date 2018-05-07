FROM php:5.6-apache
LABEL maintainer="Scott Horsfield <shhorsfi@amazon.com>"

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev unzip && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
RUN docker-php-ext-install mysqli

VOLUME /var/www/html

ENV WORDPRESS_VERSION 4.2.1
ENV WORDPRESS_UPSTREAM_VERSION 4.2.1
ENV WORDPRESS_SHA1 c93a39be9911591b19a94743014be3585df0512f
ENV AWS_PLUGIN_VERSION 1.0.5
ENV S3_CLOUDFRONT_PLUGIN_VERSION 1.3.2

# upstream tarballs include ./wordpress/ so this gives us /usr/src/wordpress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_UPSTREAM_VERSION}.tar.gz \
	&& echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c - \
	&& tar -xzf wordpress.tar.gz -C /usr/src/ \
	&& rm wordpress.tar.gz \
	&& chown -R www-data:www-data /usr/src/wordpress

# Download AWS Wordpress Plugin
RUN curl -o amazon-web-services.zip https://downloads.wordpress.org/plugin/amazon-web-services.${AWS_PLUGIN_VERSION}.zip \
  && unzip amazon-web-services.zip -d /usr/src/wordpress/wp-content/plugins \
	&& rm amazon-web-services.zip

# Download S3 and CloudFront plugin
RUN curl -o amazon-s3-and-cloudfront.zip https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.${S3_CLOUDFRONT_PLUGIN_VERSION}.zip \
  && unzip amazon-s3-and-cloudfront.zip -d /usr/src/wordpress/wp-content/plugins \
	&& rm amazon-s3-and-cloudfront.zip

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
