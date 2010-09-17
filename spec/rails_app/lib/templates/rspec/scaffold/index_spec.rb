require 'spec_helper'

describe '<%= table_name %>/index.html.<%= options[:template_engine] %>' do
  before do
    assign(:<%= table_name %>, [<%= table_name %>(:one)])
  end

  it 'should render successfully' do
    render
  end
end
