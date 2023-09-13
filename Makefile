
TOPDIR=$(PWD)

help:
	echo "To build Wordpress plugins"

docker:
	bash -x $(TOPDIR)/dev_container.sh

srcinit:
	git clone https://github.com/ManiruzzamanAkash/wp-react-kit.git

/usr/local/bin/composer:
	curl -sS https://getcomposer.org/installer -o composer-setup.php
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer

projinit: /usr/local/bin/composer
	apt-get install -y nodejs npm
	# Install PHP-composer dependencies [It's empty]
	composer install
	# Install node module packages
	npm install
	# Start development mode
	npm start
	# Start development with hot reload (Frontend components will be updated automatically if any changes are made)
	npm run start:hot
	# To run in production
	npm run build