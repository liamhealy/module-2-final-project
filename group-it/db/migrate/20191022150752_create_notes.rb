class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :group_member, foreign_key: true
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
