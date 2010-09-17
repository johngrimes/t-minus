require 'spec_helper'

describe '<%= table_name %>/edit.html.<%= options[:template_engine] %>' do
  before do
    assign(:<%= file_name %>, <%= table_name %>(:one))
  end

  it 'should render successfully' do
    render
  end
end
