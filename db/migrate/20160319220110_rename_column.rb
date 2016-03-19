class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :answers, :question_id, :integer
  end
end
