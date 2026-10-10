# Automatically create an Nginx server

terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.2"
        }
    }
}

provider "docker" {}

resource "docker_image" "nginx" {
    name = "nginx:latest"
    keep_locally = false
}

resource "docker_container" "docker" {
    image = "docker_image.nginx.latest"
    name = "demo"
    ports {
        internal = 80
        external = 80
    }
}