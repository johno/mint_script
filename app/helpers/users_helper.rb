module UsersHelper

  def follow_link(user_id)
    form_for(current_user.relationships.build) do |f|
      capture do
        concat f.hidden_field :followed_id, value: user_id
        concat f.submit :Follow, class: 'pure-button'
      end
    end.html_safe
  end

  def unfollow_link(user_id)
    form_for(current_user.relationships.find { |r| r.followed_id == user_id }, html: { method: :delete }) do |f|
      capture do
        concat f.submit :Unfollow, class: 'pure-button'
      end
    end.html_safe
  end
end
