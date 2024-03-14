# Estructura de la imagen

la imagen está basada en `php:7.2-apache` con `docker-php-extension-installer` para la instalacion de requisitos.

tambien incluye la modificación de `php.ini` acorde a la recomendación de la Instalación de Chamilo y la habilitación de `rewrite` de apache2

# Construir imagen en docker

Desde esta carpeta

```sh
./build.sh
```

Lo que crea la imagen `chamilo:1.11.10`

# Levantar el contenedor

mediante Portainer/Compose:

Ejemplo con un contenedor adicional para la base de datos

```yaml
version: '2'
services:
  libreoffice:
    image: xcgd/libreoffice:6
    container_name: libreoffice
    hostname: libreoffice.docker
    restart: always
    volumes:
      - type: tmpfs
        target: /tmp
    network_mode: bridge
  chamilo_db:
    image: mariadb:10.5
    container_name: chamilo_db
    hostname: chamilo_db.docker
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: passforrootonchamilo
    volumes:
      - chamilo_db_data:/var/lib/mysql
    network_mode: bridge
  chamilo:
    image: chamilo:1.11.10
    container_name: chamilo
    hostname: chamilo.docker
    restart: always
    volumes:
      - chamilo_images:/var/www/html/chamilo/main/default_course_document/images/
      - chamilo_lang:/var/www/html/chamilo/main/lang/
      - chamilo_web:/var/www/html/chamilo/web/
      - chamilo_app:/var/www/html/chamilo/app/
      - chamilo_vendor:/var/www/html/chamilo/vendor
#      - /tmp/empty_dir_after_install:/var/www/html/chamilo/main/install
    ports:
      - "8069:80"
    network_mode: bridge
    depends_on:
      - chamilo_db
    links:
      - "chamilo_db"
      - "libreoffice"
```

