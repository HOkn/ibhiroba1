class AddDetails3ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :screen_name, :string
    add_column :users, :residence_country, :string
    add_column :users, :residencenow, :string
    add_column :users, :origin, :string
    add_column :users, :status, :string
    add_column :users, :mailmagazine, :boolean
    add_column :users, :privacy, :boolean
    add_column :users, :school, :string
    add_column :users, :bio, :text
    add_column :users, :comment, :text
    add_column :users, :child_age1, :integer
    add_column :users, :child_age2, :integer
    add_column :users, :wannaknow, :text
    add_column :users, :know, :text
  end
end
