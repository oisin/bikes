require 'date'

Gem::Specification.new do |s|
  s.name        = 'bikes'
  s.version     = '0.0.2'
  s.date        = Date.today.to_s
  s.license     = 'BSD'
  s.summary     = "JCDecaux Bikes Client"
  s.description = "Ruby client for JCDecaux urban bike rental schemes"
  s.authors     = ["Oisin Hurley"]
  s.email       = 'oisin@nis.io'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/bikes'
  s.add_runtime_dependency 'httparty', '~> 0.13', '>= 0.13.1'
  s.add_runtime_dependency 'json', '~> 1.8', '>= 1.8.1'
  s.add_runtime_dependency 'hashie', '~> 2.1', '>= 2.1.2'
  s.add_development_dependency 'webmock', '~> 1.19', '>= 1.19.0'
  s.add_development_dependency 'minitest', '~> 5.3', '>= 5.3.5'
end
