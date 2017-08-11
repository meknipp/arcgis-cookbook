# Sets up vba compatibility for ArcGIS Desktop 10.2.1 and earlier.


action :install do
  if node['platform'] == 'windows'
    cmd = "msiexec /i "
    setup = @new_resource.setup
    args = "/qn"
    
    cmd = Mixlib::ShellOut.new("#{cmd} \"#{setup}\"  #{args}", { :timeout => 3600 })
    cmd.run_command
    cmd.error!

    new_resource.updated_by_last_action(true)
  end
end

action :installvbaof11 do
  if node['platform'] == 'windows'
    cmd = "msiexec /i "
    setup = @new_resource.vbaof11
    args = "/qn"
    
    cmd = Mixlib::ShellOut.new("#{cmd} \"#{setup}\"  #{args}", { :timeout => 3600 })
    cmd.run_command
    cmd.error!
    
    new_resource.updated_by_last_action(true)
  end
end

action :installvbaof11i do
  if node['platform'] == 'windows'
    cmd = "msiexec /i "
    setup = @new_resource.vbaof11i
    args = "/qn"
    
    cmd = Mixlib::ShellOut.new("#{cmd} \"#{setup}\"  #{args}", { :timeout => 3600 })
    cmd.run_command
    cmd.error!
    
    new_resource.updated_by_last_action(true)
  end
end

action :uninstall do
  if node['platform'] == 'windows'
    if Utils.product_installed?(node['arcgis']['vba']['product_code']) 
    cmd = 'msiexec'
    args = " /x #{@new_resource.product_code} /qn"

    cmd = Mixlib::ShellOut.new("\"#{cmd}\" #{args}", { :timeout => 3600 })
    cmd.run_command
    cmd.error!
    end
    
    if Utils.product_installed?(node['arcgis']['vba']['vbaof11_product_code']) 
      cmd = 'msiexec'
      args = " /x #{@new_resource.vbaof11_product_code} /qn"

      cmd = Mixlib::ShellOut.new("\"#{cmd}\" #{args}", { :timeout => 3600 })
      cmd.run_command
      cmd.error!
    end
    
    if Utils.product_installed?(node['arcgis']['vba']['vbaof11i_product_code']) 
      cmd = 'msiexec'
      args = " /x #{@new_resource.vbaof11i_product_code} /qn"

      cmd = Mixlib::ShellOut.new("\"#{cmd}\" #{args}", { :timeout => 3600 })
      cmd.run_command
      cmd.error!
    end

    new_resource.updated_by_last_action(true)
  end
end