powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  not_if '(Get-WindowsFeature -Name Web-Server).Installed'
end

template 'C:\inetpub\wwwroot\Default.htm' do
 source 'Default.htm.erb'
end
service 'w3svc' do
  action [:enable, :start]
end
