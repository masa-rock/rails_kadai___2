class AddColumnToRoomUser < ActiveRecord::Migration[6.1]
  def change
    add_column :room_users, :people, :integer
    add_column :room_users, :days, :integer
    add_column :room_users, :totalamount, :integer
  end
end
