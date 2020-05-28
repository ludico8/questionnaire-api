class User < ApplicationRecord
  has_many :answers
  has_many :questions, through: :answers

  validates_presence_of :name
  validates_presence_of :email
end