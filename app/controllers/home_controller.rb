# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @characters = Character.all.page(params[:page]).per(50)
  end
end
