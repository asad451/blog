class Post < ActiveRecord::Base
	has_many :comments
	validates :title, presence: true,
                    length: { minimum: 5 }

    belongs_to :user

end
