group "ci_targets" {
  targets = ["certbot-cloudflare"]
}
target "ci_platforms" {
	platforms = ["linux/amd64", "linux/arm64"]
}

target "docker-metadata-action" {}

group "default" {
  targets = ["certbot-cloudflare"]
}

target "certbot-cloudflare-local" {
  tags = ["certbot-cloudflare:local"]
}

target "certbot-cloudflare" {
	inherits = ["certbot-cloudflare-local", "ci_platforms", "docker-metadata-action"]
	context = "certbot-cloudflare"
	dockerfile = "Dockerfile"
}