class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:update, :create]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: "Project was successfully updated." }
        format.js
      else
        format.html { render :edit, error: "Project could not be updated" }
        format.js { render text: @project.errors.full_messages.join(". "), status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.image = nil
    @project.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js
    end
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: "Project has been created." }
        format.js
      else
        format.html { render :new, error: "Project could not be saved." }
        format.js { render text: @project.errors.full_messages.join(". "), status: :unprocessable_entity }
      end
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used, :image)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
