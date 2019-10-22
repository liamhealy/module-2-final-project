class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :theme
      t.text :description

      t.timestamps
    end
  end
end
