require 'rubygems'
require 'sinatra'

class Proxmox
  def self.run(cmd)
    `#{cmd}`
  end
  
  def self.api_key
    File.read("#{ENV['HOME']}/.proxapi.key").chomp
  end
  
  def self.valid_key?(params)
    params[:api_key] == Proxmox.api_key
  end
end

class ProxApi < Sinatra::Base

  before do
    throw(:halt, [401, "Not authorized\n"]) unless Proxmox.valid_key?(params)
  end

  post '/vms' do
    args = params.find_all { |k, v| ![ 'id', 'api_key' ].include?(k) }.map { |k, v| "--#{k} #{v}" }.join(' ')
    Proxmox.run "/usr/bin/pvectl vzcreate #{params[:id]} #{args}"
  end

  post '/vms/:id/start' do
    Proxmox.run "/usr/sbin/vzctl start #{params[:id]}"
  end

  post '/vms/:id/stop' do
    Proxmox.run "/usr/sbin/vzctl stop #{params[:id]} --fast"
  end

  post '/vms/:id/exec' do
    Proxmox.run "/usr/sbin/vzctl exec #{params[:id]} '#{params[:command]}'"
  end

  delete '/vms/:id' do
    Proxmox.run "/usr/sbin/vzctl destroy #{params[:id]}"
  end

end