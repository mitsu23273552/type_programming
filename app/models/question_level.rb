class QuestionLevel < ActiveHash::Base
  self.data = [
    { id: 0, name: '(難易度を入力してください)' },
    { id: 1, name: 'LEVEL 1' },
    { id: 2, name: 'LEVEL 2' },
    { id: 3, name: 'LEVEL 3' },
    { id: 4, name: 'LEVEL 4' },
    { id: 5, name: 'LEVEL 5' }
  ]

  include ActiveHash::Associations
  has_many :questions
end
