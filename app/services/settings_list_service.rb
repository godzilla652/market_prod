class SettingsListService
  def self.call
    new.call
  end

  def call
    all_settings
        .map { |k, v| [k.split('.'), v] }
        .group_by { |k, _| k.first }
        .map { |k, v| [k, v.map { |name, value| [name.last, value] }.to_h] }
  end

  private

  def all_settings
    @all_settings ||= Settings
  end
end
