module Nurses
  class AnswersController < ApplicationController

    def index
      @question = Question.find(params[:question_id])
      @answers = Answer.where
    end

    def new
      @answer = Answer.new
      @question = Question.find(params[:question_id])
    end

    def create 
      @question = Question.find(params[:question_id])
      @answer = current_user.answers.create(answer_params)

      if @answer.save
        @question.answers << @answer
        redirect_to nurses_question_answers_path
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

    private

    def answer_params
      params.require(:answer).permit(:content)
    end
  end
end
