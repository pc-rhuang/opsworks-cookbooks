#
# Cookbook Name:: bastion
#

bash 'delete user key' do
  code <<-EOH
    sed -i "/#{node[:bastion][:authorized_user_name]}/d" \
      /home/#{node[:bastion][:connection_user_name]}/.ssh/authorized_keys
  EOH
  only_if "grep #{node[:bastion][:authorized_user_name]}@personalcapital.com \
     /home/#{node[:bastion][:connection_user_name]}/.ssh/authorized_keys"
end
