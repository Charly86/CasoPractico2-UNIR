variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

#Se configura una maquina más potente para el master
variable "vm_size_master" {
  type = string
  description = "Tamaño de la máquina virtual master"
  default = "Standard_D2_v2" # 7 GB, 2 CPU 
}

#Se configuran maquinas menos potentes para los workers i nfs
variable "vm_size_workers_nfs" {
  type = string
  description = "Tamaño de la máquina virtual workers y nfs"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU 
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