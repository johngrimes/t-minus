require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 't-minus'
    gem.summary = %Q{Prelaunch page and subscriber list for your Rails app.}
    gem.description = %Q{Rails engine and generators that make it easier to create a prelaunch page for your application that can collect email addresses of interested visitors.}
    gem.email = 'john@smallspark.com.au'
    gem.homepage = 'http://github.com/johngrimes/t-minus'
    gem.authors = ['John Grimes']
    gem.add_dependency 'campaigning', '>= 0'
    gem.add_development_dependency 'rspec', '>= 2.0.0.beta.20'

    gem.files = FileList['app/**/*', 'config/**/*', 'lib/**/*']
    gem.test_files = FileList['spec/**/*_spec.rb']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
