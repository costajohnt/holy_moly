class QuestionsController < ApplicationController
  helper :headshot

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
      @question.headshot_photos << HeadshotPhoto.last
    if @question.save
      flash[:notice] = "Question saved."
    else
      flash[:error] = @question.errors.full_messages.join(', ')
    end
    redirect_to user_questions_path(current_user.id)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
      @question = Question.find(params[:id])
      @answers = Answer.where(question_id: params[:id])
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
