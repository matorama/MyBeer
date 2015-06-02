class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :aroma
      t.text :appearance
      t.text :taste
      t.text :palate
      t.text :overall
      t.integer :score
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
