When /^the (.*) generator is executed$/ do |generator|
  in_test_app_directory do
    `rails generate #{generator}`
  end
end

Then /^file "(.*)" (is|is not) created/ do |file, is|
  in_test_app_directory do
    File.exists?(file).should(is == 'is' ? be_true : be_false)
  end
end

Then /^file with name matching "(.*)" is created/ do |pattern|
  in_test_app_directory do
    Dir[pattern].should_not be_empty
  end
end
