def simulate_prelaunch_routes
  Rails.application.routes.clear!
  TMinus::Routes.map
end

def restore_routes
  Rails.application.routes.clear!
  load(File.expand_path('config/routes.rb', Rails.root))
end
