module FileHelper
  def in_test_app_directory(&block)
    FileUtils.chdir(@test_app_path, &block)
  end

  def remove_all_tminus_files
    FileUtils.rm_rf(Dir.glob('db/migrate/*_create_prelaunch_subscribers.rb') +
                    ['app/controllers/prelaunch_controller.rb',
                     'app/models/prelaunch_subscriber.rb',
                     'app/views/prelaunch',
                     'config/prelaunch_config.yml'])
  end
end

World(FileHelper)
