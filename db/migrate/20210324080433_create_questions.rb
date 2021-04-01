class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :user,           foreign_key: true
      t.text :title,                null: false
      t.text :answer,               null: false
      t.text :commentary,           null: false
      t.integer :question_level_id, null: false
      
      t.timestamps
    end
  end
end
