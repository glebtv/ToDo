class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @authored_task = current_user.created_tasks
      @visible_tasks = current_user.tasks
    else
      @authored_task = @user.tasks.authored(current_user)
      @visible_tasks = @user.tasks.assigned(current_user)
    end
  end

end
