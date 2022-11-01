terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
     }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "ssh_key" {
  name = "lab5"
}

data "digitalocean_project" "lab_project" {
  name = "4640"
}

resource "digitalocean_tag" "do_tag" {
  name = "Web"
}

resource "digitalocean_vpc" "web_vpc" {
  name = "web"
  region = "sfo3"
}

resource "digitalocean_droplet" "web" {
  image = "rockylinux-9-x64"
  name = "web-1"
  tags = [digitalocean_tag.do_tag.id]
  region = "sfo3"
  size = "s-1vcpu-512mb-10gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh_key.id]
  vpc_uuid = digitalocean_vpc.web_vpc.id
}

resource "digitalocean_project_resources" "project_attach" {
  project = data.digitalocean_project.lab_project.id
  resources = [digitalocean_droplet.web.urn]
}

output "server_ip" {
  value = digitalocean_droplet.web.ipv4_address
}


