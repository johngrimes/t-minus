module FileHelper
  def in_test_app_directory(&block)
    FileUtils.chdir(@test_app_path, &block)
  end
end

World(FileHelper)
