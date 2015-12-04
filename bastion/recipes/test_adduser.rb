#
# Cookbook Name:: bastion::test_adduser
#

node.default[:bastion][:users] = [ {:username => 'rhuang', :pubkey => ''}, {:username => 'romi', :pubkey => ''} ]

node[:bastion][:users].each do |user|
  puts "in loop for #{user['username']}"
  bash "create_user_#{user}" do
    user "root"
    code do
      puts "running 'useradd' for #{user['username']}"
      "useradd #{user['username']}"
    end
  end
end

