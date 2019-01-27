class RenameSquiresToEditability < ActiveRecord::Migration[5.2]
  def change
    rename_table :squires, :editors #この行を追加！
  end
end
