maintainer       "Personal Capital, Inc."
maintainer_email "sysops@personalcapital.com"
license          "Copyright RightScale, Inc. All rights reserved."
description      "Installs/Configures Bastion host"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"




recipe "bastion::default",
  "Install the default dependencies for bastion"
recipe "bastion::add_user",
  "Add a new user can ssh to bastion server"
recipe "bastion::remove_user",
  "Remove a user from ssh to bastion server"

# Attributes

attribute "bastion/ssh_port",
  :display_name => "Bastion server sshd listion port",
  :description =>
    "Default sshd listen port.",
  :required => "required",
  :recipes => [
    "bastion::default"
  ]

attribute "bastion/connection_user_name",
  :display_name => "User name for connection",
  :description =>
    "User's name used to connect to bastion server .",
  :required => "required",
  :recipes => [
    "bastion::default"
  ]

attribute "bastion/user_key",
  :display_name => "Pub key to autherized",
  :description =>
    "User's pub key to add to bastion server authorized_keys file.",
  :required => "required",
  :recipes => [
    "bastion::add_user"
  ]

attribute "bastion/authorized_user_name",
  :display_name => "User name to autherized",
  :description =>
    "User's name to add or remove from bastion server authorized_keys file.",
  :required => "required",
  :recipes => [
    "bastion::add_user", "bastion::remove_user"
  ]

