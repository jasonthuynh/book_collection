class Book < ApplicationRecord
    validates :title, presence: true
    # validates :price, presence: true
    # validates :published_date, presence: true
    # validates :author, presence: true
end
