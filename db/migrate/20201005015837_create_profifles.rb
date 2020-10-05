class CreateProfifles < ActiveRecord::Migration[6.0]
  def change
    create_table :profifles do |t|
      t.references :user, null: false
      t.string :nickname
      t.text :introduction
      t.timestamps
    end
  end
end
