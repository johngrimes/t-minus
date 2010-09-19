module TMinus
  module Routes
    def Routes.map
      Rails.application.routes.draw do
        post '/' => 'prelaunch#create', :as => :prelaunch
        root :to => 'prelaunch#new'
      end
    end
  end
end

TMinus::Routes.map if PRELAUNCH_CONFIG[:active]
