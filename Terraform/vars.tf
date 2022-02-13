variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

#Se configura una maquina más potente para el master
variable "vm_size_master" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_A4_v2" # 8 GB, 2 CPU 
}

#Se configuran maquinas menos potentes para los workers i nfs
variable "vm_size_workers_nfs" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_A2_v2" # 4 GB, 2 CPU 
}

variable "vms_master" {
  type = list(string)
  description = "Máquinas virtuales a crear como master"
  default = ["master"]
}

variable "vms_workers_nfs" {
  type = list(string)
  description = "Máquinas virtuales a crear como workers y nfs"
  default = ["worker01","worker02","nfs"]
}