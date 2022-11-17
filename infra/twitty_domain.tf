resource "digitalocean_domain" "twitty_online" {
  name = "twitty.online"
}

resource "digitalocean_domain" "twitty_codes" {
  name = "twitty.codes"
}

resource "digitalocean_record" "code_server_a_record" {
  domain = digitalocean_domain.twitty_online.name
  type = "A"
  name = "code"
  value = digitalocean_droplet.code.ipv4_address
}

resource "digitalocean_record" "code_server_twitty_codes" {
  domain = digitalocean_domain.twitty_codes.name
  type = "A"
  name = "cory"
  value = digitalocean_droplet.code.ipv4_address
}

output "twitty_online_fqdn" {
  value = digitalocean_record.code_server_a_record.fqdn
}
