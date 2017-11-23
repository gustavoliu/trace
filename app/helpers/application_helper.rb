module ApplicationHelper

   def avatar(professional, attrs = {})
    if professional.google_photo != nil && professional.photo == nil
      cl_image_tag(professional.google_photo.path, attrs)
    elsif professional.photo != nil && professional.google_photo == nil
      cl_image_tag(professional.photo.path, attrs)
    else
      image_tag("http://placehold.it/50/50", attrs)
    end
  end

end
