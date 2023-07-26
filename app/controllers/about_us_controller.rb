class AboutUsController < ApplicationController
  def show
    @about_us = AboutUs.first # Assuming you want to display the first record. You can customize this to fetch the specific record you want.
  end
end
