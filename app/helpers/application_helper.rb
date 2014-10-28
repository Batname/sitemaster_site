module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = t :meta_1
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Returns the full title on a per-page basis.
  def full_description(page_description)
    base_description = t :meta_description_1
    if page_description.empty?
      base_description
    else
      "#{base_description} | #{page_description}"
    end
  end

end
