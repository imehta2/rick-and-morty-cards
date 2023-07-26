ActiveAdmin.register ContactUs do
  permit_params :content

  show do
    render "contact_us/show"
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :content, as: :text_area
    end
    f.actions
  end
end
