class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :blogger, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
