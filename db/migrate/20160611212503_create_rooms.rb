class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|

      t.timestamps
    end

    add_column :messages, :room_id, :integer

  end
end
