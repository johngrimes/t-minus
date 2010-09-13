class PrelaunchController < ApplicationController
  def new
    @prelaunch_subscriber = PrelaunchSubscriber.new
  end

  def create
    @prelaunch_subscriber = PrelaunchSubscriber.new(params[:prelaunch_subscriber])
    @prelaunch_subscriber.save
    render :action => 'new'
  end
end
