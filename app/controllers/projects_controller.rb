class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @project = Project.new(user: current_user)

    respond_to do |format|
      format.html
      format.js { raise :lol }
    end
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to projects_path }
      else
        format.html { render :edit }
      end
    end
  end
end
