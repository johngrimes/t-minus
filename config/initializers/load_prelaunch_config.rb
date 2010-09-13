raw_config = File.read("#{Rails.root}/config/prelaunch_config.yml")
PRELAUNCH_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys

CAMPAIGN_MONITOR_API_KEY = PRELAUNCH_CONFIG[:campaign_monitor_api_key]
