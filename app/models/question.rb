class Question < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :question_level

  with_options presence: true do
    validates :title
    validates :answer
    validates :commentary
    with_options numericality: { other_than: 0, message: 'を選択してください' } do
      validates :question_level_id
    end
  end
end
