Given /a clean project/ do
  in_test_app_directory do
    remove_all_tminus_files
  end
end

Given /a project with T-Minus installed/ do
  in_test_app_directory do
    remove_all_tminus_files
    `rails generate t_minus:install`
  end
end
