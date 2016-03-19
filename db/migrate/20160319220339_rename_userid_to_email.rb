class RenameUseridToEmail < ActiveRecord::Migration
  def change
    rename_colume :answers do |t|
      t.rename :user_id, :email, :string
    end
  end
end
