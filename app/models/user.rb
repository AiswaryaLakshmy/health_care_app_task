class User < ActiveRecord::Base

	has_many :medications
  has_many :drugs, through: :medications
	# EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
	validates :password, presence: true, confirmation: true
	# validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates_length_of :password, in: 4..20, on: :create
	validates :First_name, presence: true
	validates :Last_name, presence: true
	
end
