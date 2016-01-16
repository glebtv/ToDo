class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  def index
    @authored_task = Task.authored(current_user)
    @visible_tasks = Task.assigned(current_user)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.author_id = current_user.id
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js{ head :ok}
        format.html{redirect_to @task, notice: 'Task was successfully updated.'}
      else
        format.html{render :edit}
        format.js{ render json: {errors: @task.errors.full_messages.join(", ")}, status: 422}
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :content, :mutual_task, :complete, user_ids:[])
    end

    def check_user
      unless @task.visible_for current_user
        redirect_to '/'
        flash[:error] = 'You can\'t see this'
      end
    end
end
