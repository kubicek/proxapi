# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "proxapi/version"

Gem::Specification.new do |s|
  s.name        = "proxapi"
  s.version     = Proxapi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joakim Kolsjö"]
  s.email       = ["joakim.kolsjo@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{An experimental REST-API for proxmox vms.}
  s.description = %q{An experimental REST-API for creating/maintaining/destroying proxmox vms.}

  s.rubyforge_project = "proxapi"

  s.add_dependency "sinatra"

  s.add_development_dependency "rake"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "flexmock"

  s.add_development_dependency "kicker"
  s.add_development_dependency "activesupport"
  s.add_development_dependency "i18n"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
