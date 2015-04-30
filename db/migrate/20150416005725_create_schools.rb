class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.text :name
      t.text :location
      t.boolean :kindergarten
      t.boolean :primary
      t.boolean :middle
      t.boolean :high
      t.text :program

      t.timestamps null: false
    end
  end
end
