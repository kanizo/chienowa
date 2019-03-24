class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :editor, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id, :editor_id], unique: true
    end
  end
end
