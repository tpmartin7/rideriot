# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
Rails.application.reloader.to_prepare do
  # badge_id = 1 ||
  [{
    id: 1,
    name: 'first-route',
    description: 'Completed first cycle route',
    custom_fields: { difficulty: :bronze }
   }, {
    id: 2,
    name: '5-miles',
    description: 'Cycled a total of 5 miles',
    custom_fields: { difficulty: :bronze }
   }, {
    id: 3,
    name: '5-routes',
    description: 'Completed five cycle routes',
    custom_fields: { difficulty: :silver }
   }, {
    id: 4,
    name: '20-miles',
    description: 'Cycled a total of 20 miles',
    custom_fields: { difficulty: :silver }
   }].each do |attrs|
    Merit::Badge.create! attrs
    # badge_id += 1
  end
end

# {
#   id: (badge_id = badge_id+1),
#   name: 'first-route',
#   description: 'You completed your first cycle route',
#   level: 0,
#   custom_fields: { difficulty: :bronze }
# }
