module ApplicationHelper
  def link_with_icon(options = {})
    path = options[:path]
    icon = options[:icon]
    text = options[:text].to_s.titleize
    method = options[:method]
    id = options[:id]

    if method.nil?
      return link_to "#{icon(icon)} #{text}".html_safe, path, id: id, class: options[:class]
    else
      return link_to "#{icon(icon)} #{text}".html_safe, path, method: method, id: id, class: options[:class]
    end
  end
  
  def icon(icon)
    "<i class='#{icon}'></i>".html_safe
  end
end
