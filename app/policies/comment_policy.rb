class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def approve?
    return unless @user.present?
      @user.editor? || @user.author?
  end

end
