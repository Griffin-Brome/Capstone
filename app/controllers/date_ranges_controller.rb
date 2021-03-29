# frozen_string_literal: true

# Controller for Date Ranges
class DateRangesController < ApplicationController
  def index
    @date_ranges = DateRange.all
  end

  def show
    @date_range = DateRange.find(params[:id])
  end

  def new
    @date_range = DateRange.new
  end

  def create
    @date_range = DateRange.new(date_range_params)

    if @date_range.save
      redirect_to @date_range
    else
      render :new
    end
  end

  def edit
    @date_range = DateRange.find(params[:id])
  end

  def update
    @date_range = DateRange.find(params[:id])

    if @date_range.update(date_range_params)
      redirect_to @date_range
    else
      render :edit
    end
  end

  def destroy
    @date_range = DateRange.find(params[:id])
    @date_range.destroy

    redirect_to date_ranges_path
  end

  private

  def date_range_params
    params.require(:date_range).permit(:name, :start, :end)
  end
end
