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
