module Nurses
  class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end
  end
end