require 'spec_helper'

describe '<%= file_name %>/<%= @action %>.html.<%= options[:template_engine] %>' do
  it 'should render successfully' do
    render
  end
end
