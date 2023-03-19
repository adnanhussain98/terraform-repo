# variable "instance-type" {
#   default = "t2.micro"
# }

# if we create a variable and leave it empty, when running terraform plan/apply, it'll ask you for the instance type
variable "instance-type" {
  default = "t2.micro"
}

# adding a command line flag for profile selection is really good when handling multiple accounts
# useful for dev, uat, prod
# instead of entering the profile name each time, saving and then applying it, we can apply and then specify the profile name in the terminal.
variable "profile-name" {
  
}