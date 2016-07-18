class Drug < ActiveRecord::Base
	has_many :medications
  has_many :users, through: :medications
  DEFAULT = ['Paracetamol', 'Calpol', 'Carmicide', 'Moxikind', 'Meftal']
end
