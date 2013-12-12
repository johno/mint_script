module ScriptsHelper

  def edit_script_button(script)
    link_to '<i class="fa fa-edit"></i> &nbsp; EDIT'.html_safe, 
            edit_script_path(script), 
            class: 'pure-button'
  end

  def pdf_script_button(script)
    link_to '<i class="fa fa-file-text"></i> &nbsp; PDF'.html_safe, 
            script_path(script, format: :pdf), 
            class: 'pure-button'
  end

  def add_script_button
    link_to '<i class="fa fa-plus"></i>'.html_safe, 
        new_script_path, 
        class: 'pure-button'
  end

  def scripts_button
    link_to '<i class="fa fa-folder-open"></i> &nbsp; ALL'.html_safe,
            scripts_path,
            class: 'pure-button'
  end

  def preview_script_button(script)
    link_to '<i class="fa fa-book"></i> &nbsp; PREVIEW'.html_safe,
            script_path(script),
            class: 'pure-button'
  end

  def delete_script_button(script)
    link_to '<i class="fa fa-trash-o"></i> &nbsp; DELETE'.html_safe, 
            script, 
            method: :delete, 
            data: { confirm: 'Are you sure?' }, 
            class: 'pure-button'
  end

  def create_script_button
    link_to '<i class="fa fa-plus"></i> &nbsp; Create a New Script'.html_safe, 
             new_script_path, 
             class: 'pure-button'
  end

  def edit_script_title(script)
    form_for(script, remote: true) do |f|
      f.text_field :title, value: script.title || 'Unnamed Script', class: :script_title_edit
    end.html_safe
  end

  def make_public_or_private(script)
    form_for(script) do |f|
      capture do
        concat f.hidden_field(:is_private, value: script.is_private? ? false : true)
        concat f.submit "#{script.is_private? ? 'MAKE PUBLIC' : 'MAKE PRIVATE'}", class: 'pure-button'
      end
    end.html_safe
  end
end
