# Docker Compose Wordpress
This project aims to simplify Wordpress deployments. Ideally, relying on vendor supported releases as much as possible, to minimize maintenance here. The only real benefit to this project is to consolidate necessary components (nginx, Wordpress, wp-cli, etc) into a single namespace.

## Usage
Included in this repository is a `compose.yml` file as a template for how to use the images here. The configuration of these container images are very opinionated. If you rename your services, you would need to rename values in scripts here as well.

An example of an override for environment specific configurations is provided in `compose.prod.yml`.
