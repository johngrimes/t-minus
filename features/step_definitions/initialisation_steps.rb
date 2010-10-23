Given /^a clean project$/ do
end

Given /^a project with T-Minus installed$/ do
  in_test_app_directory do
    `rails generate t_minus:install`
  end
end

Given /^a clean project with no (.*) directory$/ do |directory|
  in_test_app_directory do
    FileUtils.rm_rf(directory)
  end
end
