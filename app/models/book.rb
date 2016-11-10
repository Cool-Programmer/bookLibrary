class Book < ApplicationRecord
	belongs_to :category
	belongs_to :author
	belongs_to :publisher

	validates :title, presence: true,
				length:{minimum: 5,maximum: 250}
	validates :category_id, presence: true
	validates :author_id, presence: true
	validates :publisher_id, presence: true
	validates :isbn, presence: true,
				length:{minimum: 5, maximum: 250}
	validates :price, presence:true,
				length:{minimum: 1}
	validates :description, presence: true,
				length:{minimum: 20}
	validates :buy, presence: true,
				length:{minimum: 5}
	validates :format, presence: true,
				length:{minimum: 3, maximum: 250}
	validates :pages, presence: true,
				length:{minimum: 1}
	validates :year, presence:true,
				length:{minimum: 4}
	validates :coverpath, presence:true
end
