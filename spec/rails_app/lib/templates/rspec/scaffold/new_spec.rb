require 'spec_helper'

describe '<%= table_name %>/new.html.<%= options[:template_engine] %>' do
  before do
    assign(:<%= file_name %>, <%= class_name %>.new)
  end

  it 'should render successfully' do
    render
  end
end
