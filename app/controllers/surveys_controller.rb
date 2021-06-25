class SurveysController < ApplicationController
  def index
    session[:submit] ||= 0
  end

  def create
    new_survey = Survey.create(survey_params)
    if new_survey.valid?
      session[:submit] += 1
	    flash[:success] = "Thanks for submitting this form! You have submitted this form #{session[:submit]} times."
	    puts "Process Form - Session is at: #{session[:submit]}"
	    redirect_to '/result'
    else 
      flash[:errors] = new_survey.errors.full_messages
      redirect_to '/'
    end  
  end
  
  def result
    @results = Survey.last
  end

  private
    def survey_params
      params.require(:user).permit(:name, :location, :language, :comment)
    end

end
