module ApplicationHelper
  def page_title
    title = "Morning Glory"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def member_image_tag(member, options = {})
    if member.image.present?
      path = member_path(member, format: member.image.extension)
      link_to(image_tag(path, { alt: member.name }.merge(options)), path)
    else
      ""
    end
  end
end
