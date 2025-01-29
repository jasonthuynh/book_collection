class Book < ApplicationRecord
    validates :title, presence: true
    validates :price, presence: true
    validates :publish_date, presence: true
    validates :author, presence: true
end
