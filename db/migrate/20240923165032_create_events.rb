class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :image
      t.string :tag
      t.text :profiles
      t.string :date
      t.string :location
      t.string :price
      t.text :categories
      t.string :link

      t.timestamps
    end
  end
end
