module ApplicationHelper

   def avatar(professional, attrs = {})
    if professional.photo != nil
      cl_image_tag(professional.photo.path, attrs)
    else
      image_tag("http://placehold.it/50/50", attrs)
    end
  end

end
