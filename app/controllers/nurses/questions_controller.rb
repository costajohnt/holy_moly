module Nurses
  class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def show
      @question = Question.find(params[:id])
      @answers = Answer.where(question_id: params[:id])
    end

  end
end