class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :rating
      t.text :text
      t.belongs_to :conversation, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
