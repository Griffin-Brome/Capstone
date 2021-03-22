class StudyPreferencesController < ApplicationController
    def index
        @study_preferences = StudyPreference.all
      end
    
      def show
        @study_preference = StudyPreference.find(params[:id])
      end
    
      def new
        @study_preference = StudyPreference.new
      end
    
      def create
        @study_preference = StudyPreference.new(study_preference_params)
    
        if @study_preference.save
          redirect_to @study_preference
        else
          render :new
        end
      end
    
      def edit
        @study_preference = StudyPreference.find(params[:id])
      end
    
      def update
        @study_preference = StudyPreference.find(params[:id])
    
        if @study_preference.update(study_preference_params)
          redirect_to @study_preference
        else
          render :edit
        end
      end
    
      def destroy
        @study_preference = StudyPreference.find(params[:id])
        @study_preference.destroy
    
        redirect_to study_preferences_path
      end
    
      private
    
      def study_preference_params
        params.require(:study_preference).permit(:deadline_id, :priority, :requiredTime)
      end
end
