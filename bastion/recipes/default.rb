#
# Cookbook Name:: bastion
#

node.default[:bastion][:ssh_port] = '8722'

# Create the bastion user
user "#{node[:bastion][:connection_user_name]}" do
  comment 'bastion user'
  home "/home/#{node[:bastion][:connection_user_name]}"
  manage_home true
  shell '/sbin/nologin'
end

# Create the bastion user's .ssh directory
directory "/home/#{node[:bastion][:connection_user_name]}/.ssh/" do
  recursive true
  mode '0700'
  owner "#{node[:bastion][:connection_user_name]}" 
  group "#{node[:bastion][:connection_user_name]}"
end

file "/home/#{node[:bastion][:connection_user_name]}/.ssh/authorized_keys" do
  content ""
  mode '0600'
  owner "#{node[:bastion][:connection_user_name]}"
  group "#{node[:bastion][:connection_user_name]}"
end

# Customize the sshd
bash 'Change sshd port' do
  code <<-EOH
  echo "PORT #{node[:bastion][:ssh_port]}" >> /etc/ssh/sshd_config
  echo "PORT 22" >> /etc/ssh/sshd_config
  service sshd restart
  EOH
  not_if "grep #{node[:bastion][:ssh_port]} /etc/ssh/sshd_config"
end

