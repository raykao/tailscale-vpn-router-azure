variable "tailscale_auth_key" {
    type = string
    description = "The Tailscale auth key to use for the Tailscale subnet router VPN"
}

variable "resource_group" {
  type = object({
    id = string
    name = string
    location = string
  })
  description = "The resource group to deploy the Tailscale subnet router VPN into"
}

variable "vm_name" {
    type = string
    description = "The name of the VM to deploy the Tailscale subnet router VPN into"
}

variable "subnet_id" {
    type = string
    description = "The ID of the subnet to deploy the Tailscale subnet router VPN into"
}

variable "public_ip_id" {
    type = string
    description = "The ID of the public IP to assign to the Tailscale subnet router VPN"
}

variable "tailscale_auth_key" {
    type = string
    description = "The Tailscale auth key to use for the Tailscale subnet router VPN"
}

variable "admin_username" {
    type = string
    description = "value of the admin username for the Tailscale subnet router VPN"
    default = "tailscaleadmin"
}

variable "public_key" {
    type = string
    description = "value of the ssh key for the Tailscale subnet router VPN"
}

variable "vm_size" {
    type = string
    description = "value of the VM size for the Tailscale subnet router VPN"
    default = "Standarad_F2s_v2"
}