class TimePreferencesController < ApplicationController
    def create
        @date_range = DateRange.find(params[:date_range_id])
        @time_preference = @date_range.time_preferences.create(comment_params)
        redirect_to date_range_path(@date_range)
      end

    def destroy
        @date_range = DateRange.find(params[:date_range_id])
        @time_preference = @date_range.time_preferences.find(params[:id])
        @time_preference.destroy
        redirect_to date_range_path(@date_range)
      end
    
      private
        def comment_params
          params.require(:time_preference).permit(:name, :available, :dayOfWeek, :start, :end)
        end
end
