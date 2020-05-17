class Carpool < ApplicationRecord
    belongs_to :user
    validates :price, presence: true
    validates :seats, presence: true
    validates :locationFrom, presence: true, length: { minimum: 1, maximum: 20 }
    validates :locationTo, presence: true, length: { minimum: 1, maximum: 20 }
    validates :time, presence: true
end