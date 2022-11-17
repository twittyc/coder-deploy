resource "digitalocean_droplet" "code" {
  image  = "ubuntu-20-04-x64"
  name   = "code-server"
  region = "nyc3"
  size   = "s-4vcpu-8gb"

  ssh_keys = [data.digitalocean_ssh_key.code-server-key.id]
  user_data = file("./configs/user_data.sh")
}

output "droplet_ip" {
  value = digitalocean_droplet.code.ipv4_address
}
