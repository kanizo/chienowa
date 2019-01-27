class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.text :question
      t.text :answer
      t.references :editor, foreign_key: true

      t.timestamps
    end
  end
end
