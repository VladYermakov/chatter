class AddOriginalNameAndIndicesToUser < ActiveRecord::Migration[5.0]

  def change

    add_column :users, :original_name, :string
    add_index :users, :name
    add_index :users, :email

  end

end
