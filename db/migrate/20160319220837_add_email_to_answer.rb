class AddEmailToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :email, :string
  end
end
