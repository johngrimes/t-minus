require 'spec_helper'

describe 'prelaunch/new.html.haml' do
  before do
    assign(:prelaunch_subscriber, PrelaunchSubscriber.new)
  end

  it 'should render successfully' do
    append_view_path File.expand_path('../../../../lib/generators/haml/templates', __FILE__)
    render :template => 'new.html.haml'
  end
end
