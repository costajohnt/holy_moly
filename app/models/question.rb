class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answer, dependent: :destroy
  has_many :headshot_photos, :as => :capturable
  has_many :answers, dependent: :destroy
end
