require 'spec_helper'

describe PrelaunchSubscriber do
  before do
    @prelaunch_subscriber = PrelaunchSubscriber.new(:email => 'bob@somedomain.com')
  end

  it 'should be valid' do
    @prelaunch_subscriber.should be_valid
  end

  describe 'add_to_campaign_monitor' do
    it 'should be successful' do
      CreateSend::Subscriber.expects(:add).returns(true)
      @prelaunch_subscriber.send(:add_to_campaign_monitor)
    end
  end

  describe 'campaign_monitor_configured?' do
    it 'should be successful' do
      @prelaunch_subscriber.send(:campaign_monitor_configured?).should == true
    end
  end
end
