# we can put the ip address into a variable, give it a name and then refernece this in other files
# if the ip address changes in future, we can just change the value here rather than changing it in the main config file
variable "vpn_ip" {
  default = "116.50.30.20/32"
}