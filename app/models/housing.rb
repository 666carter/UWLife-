class Housing < ApplicationRecord
    belongs_to :user
    validates :price, presence: true
    validates :howManyRooms, presence: true
    validates :address, presence: true, length: { minimum: 1, maximum: 50 }
    validates :time, presence: true, length: { minimum: 1, maximum: 30 }
end