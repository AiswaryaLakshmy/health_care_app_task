class User < ActiveRecord::Base

	validates :username, presence: true, length: { minimum: 5 }
	validates :password, presence: true, length: { minimum: 5 }

end
