class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @post = post
    @user = user
  end

  def create?
    user.editor? or not post.published?
  end

  def publish?
    user.editor?
  end

end
