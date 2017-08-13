class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :juhe_id
      t.string :title
      t.string :ingredients
      t.string :steps
      t.timestamps
    end
  end
end
