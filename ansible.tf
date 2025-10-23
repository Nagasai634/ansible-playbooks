# provider "google" {
#     project = "terraform-471709"
#     region = "us-central1"
#     credentials = file("sai.json")
# }





# locals {
#   ssh_user = "ansible"
#   ssh_pub  = file("~/.ssh/id_rsa.pub")  # path to your public key
# }

# # --- CREATE MULTIPLE TARGET VMs ---
# resource "google_compute_instance" "target_vms" {
#   count        = length(var.vm_config)                          #  change number of VMs if needed
#   name         = var.vm_config[count.index].name # e.g., target-vm-0, target-vm-1
#   machine_type = var.vm_config[count.index].machine_type
#   zone         = var.vm_config[count.index].zone

#   boot_disk {
#     initialize_params {
#       image = var.vm_config[count.index].image  # Ubuntu 24.04 LTS
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {
#       // Ephemeral public IP
#     }  # gives external IP
#   }

#   # Add your SSH key for access
#   metadata = {
#     ssh-keys = "${local.ssh_user}:${local.ssh_pub}"
#   }

#   # Optional: run startup script to enable passwordless sudo
#   metadata_startup_script = <<-EOT
#     #!/bin/bash
#     echo "${local.ssh_user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
#   EOT
# }

# # --- OUTPUTS ---
# output "target_vm_ips" {
#   value = [for vm in google_compute_instance.target_vms : vm.network_interface[0].access_config[0].nat_ip]
# }
