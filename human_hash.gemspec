# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "human_hash/version"

Gem::Specification.new do |s|
  s.name        = 'human_hash'
  s.version     = HumanHash::VERSION
  s.date        = '2012-02-29'
  s.summary     = "HumanHash"
  s.description = "Human-readable digests"
  s.authors     = ["Matt Vanderpol"]
  s.email       = 'matt@vanderpol.net'
  s.files       = ["lib/human_hash.rb"]
  s.homepage    = "https://github.com/bookwyrm/human_hash"

  s.rubyforge_project = "human_hash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end