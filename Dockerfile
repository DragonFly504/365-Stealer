FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php-sqlite3 \
    php-mbstring \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80
