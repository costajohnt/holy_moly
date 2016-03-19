module Nurses
  class AnswersController < ApplicationController

    def index
      @question = Question.find(params[:question_id])
      @answers = Answer.all
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

    private

    def answer_params
      params.require(:answer).permit(:content)
    end
  end
end
