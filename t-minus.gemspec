Gem::Specification.new do |s|
  s.name = 't-minus'
  s.version = '0.3.0'
  s.description = 'Rails engine and generators that make it easier to create a prelaunch page for your application that can collect email addresses of interested visitors.'
  s.summary = s.description
  s.authors = ['John Grimes']
  s.email = 'john@smallspark.com.au'
  s.homepage = 'http://github.com/johngrimes/t-minus'
  s.require_paths = ['lib']
  s.extra_rdoc_files = [
    'LICENSE',
    'README.markdown'
  ]
  s.files = `git ls-files -- {app,config,lib,spec}/*`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if s.respond_to? :required_rubygems_version=

  s.add_dependency 'createsend', '~> 0.2'

  s.add_development_dependency 'bundler', '~> 1'
  s.add_development_dependency 'rspec-rails', '~> 2'
  s.add_development_dependency 'mocha', '~> 0.9'
  s.add_development_dependency 'cucumber-rails', '~> 0.3'
  s.add_development_dependency 'webrat', '~> 0.7'
  s.add_development_dependency 'nokogiri', '~> 1.4.3'
end
