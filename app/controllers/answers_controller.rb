class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create 
    if current_user.role = 'nurse'
      answer_params = params.require(:answer).permit(:content)
      answer = Answer.new(answer_params)

      if answer.save
        render 'question#show'  #This is PSEUDO CODE
      end
    end
  end

  def edit
    if current_user.role = 'nurse'
      id = params[:id]
      @answer = Answer.find(id)
      render :edit #PSUEDO CODE ROUTE
    end
  end

  def update
    if current_user.role = 'nurse'
      answer_id = params[:id]
      answer = Answer.find(answer_id)
      updated_attributes = params.require(:answer).permit(:content)
      answer.updated_attributes(updated_attributes)
      render 'question#show'  #This is PSEUDO CODE
    end
  end

  def show
  end

  def delete
    if current_user.role = 'nurse'
      id = params[:id]
      answer = Answer.find(id)
      answer.destroy
      render 'question#show'  #This is PSEUDO CODE
    end
  end
end
