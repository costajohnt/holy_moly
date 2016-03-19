class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
