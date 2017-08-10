# Sets up vba compatibility for ArcGIS Desktop.


action :install do
  cmd = "msiexec /i "
  setup = @new_resource.setup
  args = "/qn"
  
  cmd = Mixlib::ShellOut.new("#{cmd} \"#{setup}\"  #{args}", { :timeout => 3600 })
  cmd.run_command
  cmd.error!

  new_resource.updated_by_last_action(true)
end

action :uninstall do
  if node['platform'] == 'windows'
    cmd = 'msiexec'
    args = "/qn /x #{@new_resource.product_code}"

    cmd = Mixlib::ShellOut.new("\"#{cmd}\" #{args}", { :timeout => 3600 })
    cmd.run_command
    cmd.error!

    new_resource.updated_by_last_action(true)
  end
end