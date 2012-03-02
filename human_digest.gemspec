# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "human_digest/version"

Gem::Specification.new do |s|
  s.name        = 'human_digest'
  s.version     = HumanDigest::VERSION
  s.date        = '2012-02-29'
  s.summary     = "HumanDigest"
  s.description = "Human-readable digests"
  s.authors     = ["Matt Vanderpol"]
  s.email       = 'matt@vanderpol.net'
  s.files       = ["lib/human_digest.rb"]
  s.homepage    = "https://github.com/bookwyrm/human_digest"

  s.rubyforge_project = "human_digest"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency 'bson', '~> 1.6.0'
end