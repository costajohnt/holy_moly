class QuestionsController < ApplicationController

  def new
    @question = Question.new
    render :new
  end

  def create
    if current_user.role = 'patient'
      # redirect user if already logged in
      @question = Question.new(question_params)
      @question.user_id = current_user.id
      if @question.save
        flash[:notice] = "Question saved."
      else
        flash[:error] = @question.errors.full_messages.join(', ')
      end
      # redirect_to "/profile"
      # refactored with route helpers:
      redirect_to profile_path
    end
  end

  def index
    @questions = Question.where(user_id: current_user.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
