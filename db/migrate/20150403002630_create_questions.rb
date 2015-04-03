class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :content
      t.string :askeduser
      t.text :keyword1
      t.text :keyword2
      t.text :keyword3
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
