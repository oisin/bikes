require 'date'

Gem::Specification.new do |s|
  s.name        = 'bikes'
  s.version     = '0.0.3'
  s.date        = Date.today.to_s
  s.license     = 'BSD-2-Clause'
  s.summary     = "JCDecaux Bikes Client"
  s.description = "Ruby client for JCDecaux urban bike rental schemes"
  s.authors     = ["Oisin Hurley"]
  s.email       = 'oisin@nis.io'
  s.files       = ['LICENSE.txt', 'README.md'] + Dir['test/**/*'] + Dir['lib/**/*']
  s.homepage    = 'https://rubygems.org/gems/bikes'
  s.add_runtime_dependency 'httparty', '~> 0.18', '>= 0.13.1'
  s.add_runtime_dependency 'json', '~> 2.5', '>= 2.5.1'
  s.add_runtime_dependency 'hashie', '~> 4.1', '>= 4.1.0'
  s.add_development_dependency 'webmock', '~> 3.13', '>= 3.13.0'
  s.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
  s.add_development_dependency 'simplecov', '~> 0.21', '>= 0.21.2'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
end
