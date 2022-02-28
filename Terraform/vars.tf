#Se configura una maquina más potente para el master y nfs
variable "vm_size_master" {
  type = string
  description = "Tamaño de la máquina virtual master y nfs"
  default = "Standard_D2_v2" # 7 GB, 2 CPU 
}

#Se configuran maquinas menos potentes para los workers
variable "vm_size_workers" {
  type = string
  description = "Tamaño de la máquina virtual workers"
  default = "Standard_A2_v2" # 4 GB, 2 CPU 
}

variable "vms_master" {
  type = list(string)
  description = "Máquinas virtuales a crear como master y nfs"
  default = ["master"]
}

variable "vms_workers" {
  type = list(string)
  description = "Máquinas virtuales a crear como workers"
  default = ["worker01"]
}