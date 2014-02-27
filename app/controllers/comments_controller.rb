class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :show, :edit, :new]
  before_action :load_commentable
  before_action :set_project, only: [:show, :edit, :index, :new]
  before_action :set_comment, only: [:index, :show, :destroy, :update]

  def index
  end

  def show
    @comment = @commentable.comments.find(params[:id])
  end

  def new
    @comment = @commentable.comments.build
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    @comment.approve!
    if @comment.update(comment_params)
      redirect_to @commentable, notice: 'Comment was successfully updated.'
    else
      redirect_to @commentable, notice: 'Comment could not be updated.'
    end
  end

  def destroy
    @comment.approve!
    if @comment.destroy
      redirect_to @commentable, notice: 'Comment successfully deleted.'
    else
      redirect_to @commentable, notice: 'Comment could not be deleted.'
    end
  end

  private

  def load_commentable
    @resource, id = request.path.split('/')[2,3]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author, :author_email, :author_url, :user_ip,
     :user_agent, :referrer, :content, :approved, :commentable_id, :commentable_type)
  end
end
