Then /^the (.*) class is defined/ do |class_name|
  Object.const_defined?(class_name).should be_true
end

When /^I run "([^\"]*)"$/ do |command|
  in_test_app_directory do
    @output = `#{command}`
  end
end

Then /^I should see (\d+) lines of output$/ do |number|
  @output.split(/\n/).size.should == number.to_i
end
