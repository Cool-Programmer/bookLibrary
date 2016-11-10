class Author < ApplicationRecord
	has_many :books
	validates :first_name, presence: true,
				length:{
					minimum: 3,
					maximum: 250
				}
	validates :last_name, presence: true,
				length:{
					minimum: 3,
					maximum: 250
				}
end
