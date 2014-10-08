class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :email
      t.string :hpassword
      t.references

      t.timestamps
    end
		add_reference :posts, :author, index: true
  end
end
