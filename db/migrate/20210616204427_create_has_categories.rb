class CreateHasCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :has_categories do |t|
      t.references :post, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
