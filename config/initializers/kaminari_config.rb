# config/initializers/kaminari_config.rb
Kaminari.configure do |config|
  config.default_per_page = 10
  config.page_method_name = :page
  config.param_name = :page


end
