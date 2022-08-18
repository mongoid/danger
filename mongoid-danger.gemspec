# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'mongoid-danger/version'

Gem::Specification.new do |s|
  s.name        = 'mongoid-danger'
  s.version     = MongoidDanger::VERSION
  s.authors     = ['dblock']
  s.email       = ['dblock@dblock.org']
  s.homepage    = 'https://github.com/mongoid/danger'
  s.summary     = 'Danger.systems conventions for mongoid projects.'
  s.description = 'Packages a Dangerfile to be used with Danger for projects within the Mongoid community.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_runtime_dependency 'danger', '~> 8.6.1'
  s.add_runtime_dependency 'danger-changelog', '~> 0.2.0'
end
