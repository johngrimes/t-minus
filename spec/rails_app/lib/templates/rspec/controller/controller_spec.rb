require 'spec_helper'

describe <%= class_name %>Controller do

<% for action in actions -%>
  describe '<%= action %> action' do
    it 'should be successful' do
      get :<%= action %>
      response.should be_success
    end
  end

<% end -%>
end
