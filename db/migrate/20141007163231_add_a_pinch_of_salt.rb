class AddAPinchOfSalt < ActiveRecord::Migration
  def change
		add_column :authors, :hsalt, :string
  end
end
