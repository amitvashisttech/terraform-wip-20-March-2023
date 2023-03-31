source "azure-arm" "autogenrated_1" { 
  azure_tags = { 
    team = "DevOps"
    project = "Packer Golden Image"
  }


  image_offer                       = "UbuntuServer"
  image_publisher                   = "Canonical"
  image_sku                         = "16.04-LTS"
  location                          = "East US"
  managed_image_name                = "my-apache-image-{{timestamp}}"
  managed_image_resource_group_name = "mycustomimages"
  os_type                           = "Linux"
  vm_size                           = "Standard_DS2_v2"
  client_secret                     = ""
  client_id                         = ""
  subscription_id                   = ""
  tenant_id                         = ""
 
}

build {
  sources = ["source.azure-arm.autogenrated_1"]

   provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["apt-get update", "apt-get upgrade -y", "apt-get -y install nginx", "echo 'Welcome to Packer' >> /var/www/html/info.html", "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"]
    inline_shebang  = "/bin/sh -x"
  }

}
  

