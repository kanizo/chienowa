class AddUserRefToEditors < ActiveRecord::Migration[5.2]
  def change
    add_reference :editors, :user, foreign_key: true
  end
end
