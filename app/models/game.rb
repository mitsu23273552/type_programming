class Game < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :record_1st
    validates :record_2nd
    validates :record_3rd
  end
end
