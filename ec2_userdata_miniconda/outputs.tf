#userdata 템플릿 코드를 외부에 노출
output "miniconda_userdata" {
  value = data.template_file.miniconda_userdata.rendered
}