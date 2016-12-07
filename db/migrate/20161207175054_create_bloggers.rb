class CreateBloggers < ActiveRecord::Migration[5.0]
  def change
    create_table :bloggers do |t|
      t.string :name
      t.integer :days
      t.string :content

      t.timestamps
    end
  end
end
