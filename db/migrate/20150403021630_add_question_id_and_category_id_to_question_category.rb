class AddQuestionIdAndCategoryIdToQuestionCategory < ActiveRecord::Migration
  def change
    add_column :question_categories, :question_id, :integer
    add_column :question_categories, :category_id, :integer
  end
end
