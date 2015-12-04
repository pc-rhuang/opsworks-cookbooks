#
# query ldap
#

ruby_block "query_ldap" do
    block do
      #tricky way to load this Chef::Mixin::ShellOut utilities
      Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)      
      ldap_command = 'echo node[:bastion][:connection_user_name]'
      ldap_command_out = shell_out(ldap_command)
      Chef::Log.info  ldap_command.stdout
    end
end
