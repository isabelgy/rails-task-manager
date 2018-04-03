class TasksController < ApplicationController
  def index         # GET /restaurants
     @tasks = Task.all
  end

  def show          # GET /restaurants/:id
    @task = Task.find(params[:id])
  end

  def new           # GET /restaurants/new
    @task = Task.new
    # a nil form
  end

  def create        # POST /restaurants
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
    # form that fills out
    # they know where to go because the path we define in the route and the form defined a post function
  end


  def edit          # GET /restaurants/:id/edit
    @task = Task.find(params[:id])
  end

  def update        # PATCH /restaurants/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to  tasks_path(@task)
  end

  def destroy       # DELETE /restaurants/:id
    @task = Task.find(params[:id])
    @task.destroy
     redirect_to  tasks_path(@task)
  end

  private
  def task_params
    params.require(:task).permit(:title, :details )
    # build in lock in the form and it will require this permit to unlock
  end
end
