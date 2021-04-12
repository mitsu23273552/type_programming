class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :user,           foreign_key: true
      t.integer :record_1st,        null: false, default: "0"
      t.integer :record_2nd,        null: false, default: "0"
      t.integer :record_3rd,        null: false, default: "0"

      t.timestamps
    end
  end
end
