composer-install:
	docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer install --ignore-platform-reqs

up:
	docker compose up -d

up-vendor:
	./vendor/bin/sail up

data:
	docker exec music-app-music-app-1 bash -c "php artisan migrate"
	docker exec music-app-music-app-1 bash -c "php artisan db:seed"
