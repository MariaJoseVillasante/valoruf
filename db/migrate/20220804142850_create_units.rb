class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.decimal :value
      t.date :period

      t.timestamps
    end
  end
end
