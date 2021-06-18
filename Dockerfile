FROM wordpress:5.7.2-php7.4-apache

COPY ./themetestdata.xml /var/www/html/themetestdata.xml

#2. Install WP-cli and dependencies to run it
RUN apt-get update \
    && apt-get install -y \
      less \
      subversion \
      sudo \
      default-mysql-client-core \
      # default-mysql-server/stable \
      mariadb-client \
    && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp

#3. Create the files for the testing environment
RUN \
      #3.1 Install phpunit
    curl -L https://phar.phpunit.de/phpunit-7.phar -o /var/www/html/phpunit \
    && chmod a+x /var/www/html/phpunit \
#     #3.2 Install wordpress
#     # && cp -r /usr/src/wordpress /tmp/wordpress \
#     # && curl https://raw.github.com/markoheijnen/wp-mysqli/master/db.php -o /tmp/wordpress/wp-content/db.php \    
    #3.3 Install the testing libraries
    && svn co --quiet https://develop.svn.wordpress.org/tags/5.3.2/tests/phpunit/includes/ /var/www/html/wordpress-tests-lib/includes \
    && svn co --quiet https://develop.svn.wordpress.org/tags/5.3.2/tests/phpunit/data/ /var/www/html/wordpress-tests-lib/data    
#     #3.4 set owner and permissions
    # && chown -R www-data:www-data /tmp/wordpress \
    # && chown -R www-data:www-data /tmp/wordpress-tests-lib

RUN \
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

# RUN \
#   # wp core download --allow-root \
#   && wp core install --allow-root  --url="localhost:7000" --title="test site" --admin_user="admin" --admin_email="subject026@protonmail.com" 

# RUN sudo -u www-data -s /bin/sh -c 'wp core install --url="localhost:8000" --title="test site" --admin_user="admin" --admin_email="subject026@protonmail.com"'

#4. Copy the script to create the testing environment when the container is started
# COPY init-testing-environment.sh /usr/local/bin/

#5. Run the script and send as an argument the command to run the apache service
# ENTRYPOINT ["init-testing-environment.sh"]
# CMD ["apache2-foreground"]