class Task < ApplicationRecord
  belongs_to :user
  has_many :volunteers
  has_many :users, through: :volunteers

end
