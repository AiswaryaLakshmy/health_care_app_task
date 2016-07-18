class Medication < ActiveRecord::Base
	belongs_to :users
  belongs_to :drugs
end
