class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :likes, as: :likeable, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
end
