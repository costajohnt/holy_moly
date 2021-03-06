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
      @answer = Answer.create(answer_params)
      @answer.email = current_user.email

      if @answer.save
        @question.answers << @answer
        redirect_to nurses_question_path(params[:question_id])
      end
    end

    private

    def answer_params
      params.require(:answer).permit(:content)
    end
  end
end
