class Drug < ActiveRecord::Base
  has_many :medications, dependent: :destroy
  has_many :users, through: :medications
end
