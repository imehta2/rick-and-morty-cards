# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @characters = Character.all
  end
end
