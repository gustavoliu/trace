module ApplicationHelper

   def avatar(professional, attrs = {})
    if professional.google_photo != nil && professional.photo == nil
      image_tag(professional.google_photo, attrs)
    elsif professional.photo != nil && professional.google_photo == nil
      cl_image_tag(professional.photo.path, attrs)
    else
      image_tag("http://placehold.it/50/50", attrs)
    end
  end

  def date_format(date)
    date.strftime("%d/%m/%Y")
  end

  def stringify(array)
    array.flatten.reject { |c| c.empty? }.uniq.join(", ")
  end

  def stringify_diseases(array_of_diseases)
    stringify(array_of_diseases.map { |d| d.ciap_code })
  end
end
