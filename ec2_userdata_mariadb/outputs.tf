output "mariadb_userdata" {
  value = data.template_file.mariadb_userdata.rendered
}