require 'spec_helper'

describe PrelaunchSubscriber do
  it 'should be valid' do
    prelaunch_subscribers(:one).should be_valid
  end

  describe 'add_to_campaign_monitor' do
    it 'should be successful' do
      Campaigning::Subscriber.any_instance.expects(:add_and_resubscribe!).returns(true)
      prelaunch_subscribers(:one).send(:add_to_campaign_monitor)
    end
  end

  describe 'campaign_monitor_configured?' do
    it 'should be successful' do
      Object.redefine_const(:PRELAUNCH_CONFIG, {
        :campaign_monitor_api_key => 'somekey',
        :campaign_monitor_list_id => 'somelistid'
      })
      prelaunch_subscribers(:one).send(:campaign_monitor_configured?).should == true
    end
  end
end
