class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = @project.tasks.includes(:owner)
  end

  def show
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to @project, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @project, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to @project, notice: "Task was successfully deleted.", status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :owner_id, :starts_at, :ends_at)
  end
end
