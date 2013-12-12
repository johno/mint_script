class StaticPagesController < ApplicationController
  skip_authorization_check
    
  def home
    redirect_to current_user ? scripts_path : try_path
  end
end
