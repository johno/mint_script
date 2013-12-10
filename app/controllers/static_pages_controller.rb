class StaticPagesController < ApplicationController
  skip_authorization_check
    
  def home
    redirect_to try_path
  end
end
