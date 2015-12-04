#
# Cookbook Name:: bastion::test_adduser
#

node[:users] = [ {:username => 'rhuang', :pubkey => ''}, {:username => 'romi', :pubkey => ''} ]

node[:users].each do |user|
  puts "in loop for #{user['username']}"
  bash "create_user" do
    user "root"
    code do
      puts "running 'useradd' for #{user['username']}"
      "useradd #{user['username']}"
    end
    not_if do
      puts "checking /etc/passwd for #{user['username']}"
      "cat /etc/passwd | grep #{user['username']}"
    end
  end
end

