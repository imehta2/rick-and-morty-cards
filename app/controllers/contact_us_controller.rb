class ContactUsController < ApplicationController
  def show
    @contact_us = ContactUs.first # Assuming you want to display the first record. You can customize this to fetch the specific record you want.
  end
end
