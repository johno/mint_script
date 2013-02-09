module ApplicationHelper
  def link_with_icon options = {}
    path = options[:path]
    icon = options[:icon]
    text = options[:text].to_s.titleize
    method = options[:method]

    if method.nil?
      return link_to "#{icon(icon)} #{text}".html_safe, path
    else
      return link_to "#{icon(icon)} #{text}".html_safe, path, method: method
    end
  end
  
  def icon icon
    "<i class='icon-#{icon}'></i>".html_safe
  end
end
