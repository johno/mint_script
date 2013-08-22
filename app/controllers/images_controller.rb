class ImagesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @image = Image.new(params[:image])
    puts params[:image].inspect
    puts @image.inspect
    @image.save!
    #params[:image].delete(:script_id)

    @image.update_attributes(name: :lol)

    respond_to do |format|
      puts :doing_update_attrs
      if true #@image.update_attributes(params[:image])
        format.js { render 'scripts/image_added' }
      else
        raise('wtf????')
      end
    end
  end
end
