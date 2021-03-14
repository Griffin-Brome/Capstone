# frozen_string_literal: true

# Controller for Deadlines
class DeadlinesController < ApplicationController
  def index
    @deadlines = Deadline.all
  end

  def show
    @deadline = Deadline.find(params[:id])
  end

  def new
    @deadline = Deadline.new
  end

  def create
    @deadline = Deadline.new(deadline_params)

    if @deadline.save
      redirect_to @deadline
    else
      render :new
    end
  end

  def edit
    @deadline = Deadline.find(params[:id])
  end

  def update
    @deadline = Deadline.find(params[:id])

    if @deadline.update(deadline_params)
      redirect_to @deadline
    else
      render :edit
    end
  end

  def destroy
    @deadline = Deadline.find(params[:id])
    @deadline.destroy

    redirect_to deadlines_path
  end

  private

  def deadline_params
    params.require(:deadline).permit(:name, :description, :date)
  end
end
