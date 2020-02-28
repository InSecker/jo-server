# JO-SERVER

This is the back-end repo for the Olympics Optimized project.

[Front repo](https://github.com/ArcanumLibella/parici)

[Website](https://olympics-optimized.netlify.com/)

## Local development

### Prerequisites:
  - **PHP 7.4**
  - **Symfony 4** 
  - **Docker** & **docker-compose**
  - **Make** command

### Start-up

**You should specify volumes option in the docker-compose file to match a local path.**

Start PHP and MySQL servers with `make local`

Hydrate the database white `make hydrate`

Stop server `make stop`

