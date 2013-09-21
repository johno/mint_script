module ScriptsHelper

  def edit_script_title(script)
    form_for(script, remote: true) do |f|
      f.text_field :title, placeholder: 'No Title Given', class: :script_title_edit
    end.html_safe
  end
end
