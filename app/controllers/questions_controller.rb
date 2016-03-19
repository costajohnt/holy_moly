class QuestionsController < ApplicationController

  def new
    @question = Question.new
    render :new
  end

  def create
    # redirect user if already logged in
    question = Question.new(question_params)
    if question.save
      flash[:notice] = "Question saved."
    else
      flash[:error] = question.errors.full_messages.join(', ')
    end
    # redirect_to "/profile"
    # refactored with route helpers:
    redirect_to profile_path
  end

  def show
    render :show
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
