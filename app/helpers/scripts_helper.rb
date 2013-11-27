module ScriptsHelper

  def edit_script_title(script)
    form_for(script, remote: true) do |f|
      f.text_field :title, placeholder: 'No Title Given', class: :script_title_edit
    end.html_safe
  end

  def make_public_or_private(script)
    form_for(script) do |f|
      capture do
        concat f.hidden_field(:is_private, value: script.is_private? ? false : true)
        concat f.submit script.is_private? ? 'Make Public' : 'Make Private', class: 'pure-button'
      end
    end.html_safe
  end
end
