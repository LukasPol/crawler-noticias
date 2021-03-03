class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :source_news
      t.string :url
      t.string :title
      t.string :caption
      t.datetime :date_publish
      t.datetime :date_crawler
      t.text :body
      t.string :tags

      t.timestamps
    end
  end
end
