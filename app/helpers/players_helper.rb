module PlayersHelper
  def country_name(country_code)
    begin
      country = ISO3166::Country[country_code]
      country.translations[I18n.locale.to_s] || country.name
    rescue
      "No nationality retrieved"
    end
  end
end
