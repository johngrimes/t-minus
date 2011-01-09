prelaunch_config_path = "#{Rails.root}/config/prelaunch_config.yml"
if File.exists?(prelaunch_config_path)
  raw_config = File.read(prelaunch_config_path)
  PRELAUNCH_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys

  campaign_monitor_api_key = PRELAUNCH_CONFIG[:campaign_monitor_api_key]
  CreateSend.api_key(campaign_monitor_api_key) if campaign_monitor_api_key.present?
else
  PRELAUNCH_CONFIG = {}
end
