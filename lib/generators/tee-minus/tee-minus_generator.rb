class TeeMinusGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_configuration_file
    copy_file 'prelaunch_config.yml', 'config/prelaunch_config.yml'
  end
end
