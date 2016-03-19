class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    # redirect user if already logged in
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "Question saved."
    else
      flash[:error] = @question.errors.full_messages.join(', ')
    end
    redirect_to user_questions_path(current_user.id)
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
