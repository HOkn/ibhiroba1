class AddSessionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :session, :string
  end
end
