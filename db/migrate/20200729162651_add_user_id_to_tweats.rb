class AddUserIdToTweats < ActiveRecord::Migration[5.2]
  def change
    add_column :tweats, :user_id, :integer
  end
end
