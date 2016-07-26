class Drug < ActiveRecord::Base
  has_many :medications
  has_many :users, through: :medication
end
