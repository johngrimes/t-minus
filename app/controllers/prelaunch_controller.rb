class PrelaunchController < ActionController::Base
  layout 'prelaunch'

  def new
    @prelaunch_subscriber = PrelaunchSubscriber.new
  end

  def create
    @prelaunch_subscriber = PrelaunchSubscriber.new(params[:prelaunch_subscriber])
    if @prelaunch_subscriber.save
      redirect_to root_url, :notice => <<NOTICE
<p>Thank you for your interest.</p>
<p>We have sent you an email to confirm your subscription to our prelaunch mailing list.</p>
NOTICE
    else
      render :action => 'new'
    end
  end
end
