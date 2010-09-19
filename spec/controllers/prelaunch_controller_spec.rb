require 'spec_helper'

describe PrelaunchController do
  describe 'new action' do
    it 'should be successful' do
      get :new
      assigns(:prelaunch_subscriber).should be_a(PrelaunchSubscriber)
    end
  end

  describe 'create action' do
    it 'should be successful' do
      PrelaunchSubscriber.any_instance.expects(:save).returns(true)
      post :create
      flash[:notice].should_not be_nil
      response.should redirect_to(root_url)
    end

    it 'should render new template if unsuccessful' do
      PrelaunchSubscriber.any_instance.expects(:save).returns(false)
      post :create
      response.should render_template('prelaunch/new')
    end
  end
end
