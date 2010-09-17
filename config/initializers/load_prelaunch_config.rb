prelaunch_config_path = "#{Rails.root}/config/prelaunch_config.yml"
if File.exists?(prelaunch_config_path)
  raw_config = File.read(prelaunch_config_path)
  PRELAUNCH_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys
  CAMPAIGN_MONITOR_API_KEY = PRELAUNCH_CONFIG[:campaign_monitor_api_key]
else
  PRELAUNCH_CONFIG = {}
end
