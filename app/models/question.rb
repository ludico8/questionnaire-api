class Question < ApplicationRecord
  has_many :answers
  has_many :users, through: :answers
  
  validates_presence_of :label
end