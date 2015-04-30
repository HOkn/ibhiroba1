class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.string :email
      t.text :school
      t.text :comment

      t.timestamps null: false
    end
  end
end
