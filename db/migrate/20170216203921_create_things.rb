class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.string :title
      t.string :address
      t.string :category
      t.text   :description

      t.timestamps
    end
  end
end
