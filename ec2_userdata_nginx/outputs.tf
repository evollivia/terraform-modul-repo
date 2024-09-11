output "nginx_userdata" {
  value = data.template_file.nginx_userdata.rendered
}