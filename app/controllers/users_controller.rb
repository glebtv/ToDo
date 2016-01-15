class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @visible_tasks = current_user.created_tasks
      @assigned_tasks = current_user.tasks
    else
      @authored_task = @user.tasks.authored(current_user)
      @visible_tasks = @user.tasks.visible_tasks(current_user)

      # @visible_tasks = @user.created_tasks.visible_tasks(current_user)
      # @assigned_tasks = @user.tasks.where(author_id: current_user)
    end
  end

end
