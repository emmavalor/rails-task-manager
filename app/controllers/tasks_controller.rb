class TasksController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    find_id
  end

  def update
    find_id
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    find_id
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_id
    @task = Task.find(params[:id])
  end
end
