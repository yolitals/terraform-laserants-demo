module "vm_test" {
  source             = "../modules/gcp-instance"
  project_name       = "wwcode-terraform-admin"
  region             = "us-central1"
  zone               = "us-central1-a"
  instance_name      = "test-instance"
  machine_type       = "f1-micro"
  boot_image         = "ubuntu-1604-xenial-v20170328"
  target_tags        = ["web-app"]
  ssh_private_key    = var.ssh_private_key
  ssh_key            = "/Users/yolandalopezsolis/.ssh/gcp.pem.pub"
  firewall_rule_name = "firewall-demo"
  local_exec         = "ansible-playbook  -e 'host_key_checking=False' ./docker.yml -i inventory -u ubuntu --private-key ${var.ssh_private_key}"
}
output "app_url" {
    value = module.vm_test.app_url
}