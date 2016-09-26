class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false, default: ""
      t.date :birthday
      t.text :address, null: false, default: ""
      t.string :district, null: false, default: ""
      t.string :zipcode, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.string :birthplace, null: false, default: ""
      t.string :nacionality, null: false, default: ""
      t.string :id_card_number, null: false, default: ""
      t.string :vat_id, null: false, default: ""
      t.string :guardian_family_degree, null: false, default: ""

      t.timestamps null: false
    end
  end
end
