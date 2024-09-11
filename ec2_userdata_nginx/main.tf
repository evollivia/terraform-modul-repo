# nginx를 설치하는 user-data
data "template_file" "nginx_userdata" {
  template = <<-EOF
    apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring
    curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
        | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
      http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
      | sudo tee /etc/apt/sources.list.d/nginx.list
    apt update
    apt install -y nginx

    echo "<h1>Hello, World!!</h1>" > /usr/share/nginx/html/index.html

    systemctl start nginx
    systemctl enable nginx
  EOF
}