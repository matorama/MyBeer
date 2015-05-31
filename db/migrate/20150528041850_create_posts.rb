class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :brewery
      t.text :description
      t.string :style
      t.float :abv
      t.string :label

      t.timestamps null: false
    end
  end
end
