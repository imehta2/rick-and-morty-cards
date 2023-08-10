# app/helpers/application_helper.rb

module ApplicationHelper
  def category_options
    available_categories = {
      "All"    => "all",
      "Male"   => "male",
      "Female" => "female",
      "Dead"   => "dead",
      "Alive"  => "alive"
    }

    # Add more categories based on the available character filter parameters.
    # For example, you can check if the 'species' filter parameter is available, and if yes, add it to the options.
    available_categories["Species"] = params[:species] if params.key?(:species)

    # Similarly, you can check for other filter parameters and add them to the options as needed.

    available_categories
  end
end
