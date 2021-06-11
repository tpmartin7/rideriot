class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @tags = Tag.all
    attempt_show
  end

  private 
  def attempt_show
    @disable_nav = true
  end

end
