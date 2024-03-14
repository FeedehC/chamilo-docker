# chamilo-docker
Chamilo with Docker Compose

Despliegue de Chamilo mediante contenedores Docker.

Requisitos:

* Docker
* (Recomendado) Docker Compose / Portainer

## [Instalacion](INSTALL.md)

Temporalmente puede usarse la imagen

```sh
docker pull kurenairyu/chamilo:1.11.10
```



### Chamilo vs Moodle?

Ventajas Chamilo:

- permite importar/generar presentaciones de PPT/ODP e importar al sistema, y agregar grabaciones de voz, evitando generar videos con imagenes estáticas.
- gestión más amigable para los distintos recursos de un curso.

Ventajas Moodle:

* Se puede hacer sandboxing para cursos de programacion con Coderunner (para python java javascript c y c++)

## Referencias
Basado en el repositorio: [Chamilo Docker GitLab](https://gitlab.softwarelibre.gob.bo/agetic/lab-agetic/proyectos/ciudades-inteligentes/chamilo-docker)
