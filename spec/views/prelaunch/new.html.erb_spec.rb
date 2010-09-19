require 'spec_helper'

describe 'prelaunch/new.html.erb' do
  before do
    assign(:prelaunch_subscriber, PrelaunchSubscriber.new)
  end

  it 'should render successfully' do
    render
  end
end
