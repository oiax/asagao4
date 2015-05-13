class ModifyMembers1 < ActiveRecord::Migration
  def change
    add_column :members, :hashed_password, :string
  end
end
