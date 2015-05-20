class CreatePostArticles < ActiveRecord::Migration
  def change
    create_table :post_articles do |t|
      t.string :title
      t.text :notes
      t.binary :image
      t.integer :category
      t.string :keywords

      t.timestamps null: false
    end
  end
end
