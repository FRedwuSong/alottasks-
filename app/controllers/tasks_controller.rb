class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "task create succefully"
      redirect_to tasks_path
    else
      flash[:alert] = "task create broken"
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Success Edit"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy if @task
    redirect_to tasks_path, notice: "Success Destroy"
  end

  def show
  end
  private
  def task_params
    params.require(:task).permit(:title, :content)
  end
end
