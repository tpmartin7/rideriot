class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!

  # app/controllers/application_controller.rb
  def default_url_options
    { host: ENV["http://www.rideriot.club/"] || "localhost:3000" }
  end

end
