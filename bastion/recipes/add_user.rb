#
# Cookbook Name:: bastion
#

bash 'add user key' do
  code <<-EOH
  echo "#{node[:bastion][:user_key]}" "#{node[:bastion][:authorized_user_name]}@personalcapital.com" >>  \
    /home/#{node[:bastion][:connection_user_name]}/.ssh/authorized_keys
  EOH
  not_if "grep #{node[:bastion][:authorized_user_name]}@personalcapital.com \
     /home/#{node[:bastion][:connection_user_name]}/.ssh/authorized_keys"
end
