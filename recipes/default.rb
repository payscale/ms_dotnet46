#
# Cookbook Name:: ms_dotnet46
# Recipe:: default
#
# Copyright 2015 PayScale
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The registry values to determine if .NET 4.6 is installed are from
# https://msdn.microsoft.com/en-us/library/hh925568(v=vs.110).aspx

if platform?('windows')
  if win_version.windows_server_2003_r2? || win_version.windows_server_2003? || win_version.windows_xp?
    Chef::Log.warn('The .NET 4.6 Chef recipe does not support Window XP, 2003, 2003 R2.')
  elsif
    unless registry_value_exists?('HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', { :name => 'Release', :type => :dword, :data => 393295 }) || registry_value_exists?('HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', { :name => 'Release', :type => :dword, :data => 393297 })
      windows_package 'Microsoft .NET Framework 4.6' do
        source node['ms_dotnet46']['http_url']
        installer_type :custom
        options '/quiet /norestart'
        timeout node['ms_dotnet46']['timeout']
        action :install
      end
    end
  end
else
  Chef::Log.warn('Microsoft .NET Framework 4.6 can only be installed on the Windows platform.')
end
