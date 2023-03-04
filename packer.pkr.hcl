
source "qemu" "builder" {
  boot_command = [
    "<enter><enter><f6><esc><wait> ",
    "autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
    "<enter><wait>"
  ]
  disk_size        = "10G"
  format           = "qcow2"
  headless         = true
  iso_checksum     = "b98dac940a82b110e6265ca78d1320f1f7103861e922aa1a54e4202686e9bbd3"
  iso_url          = "https://releases.ubuntu.com/jammy/ubuntu-22.04.2-desktop-amd64.iso"
  memory           = 2048
  net_device       = "virtio-net"
  output_directory = "output"
  ssh_password     = "ubuntu"
  ssh_timeout      = "10m"
  ssh_username     = "ubuntu"
}

build {
  sources = ["source.qemu.builder"]

  provisioner "shell" {
    script = "install-packages.sh"
  }

  post-processor "compress" {
    keep_input_artifact = false
    format              = "zip"
    output              = "macbook-ubuntu.zip"
  }
}
