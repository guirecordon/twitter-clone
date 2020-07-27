class CreateTweats < ActiveRecord::Migration[5.2]
  def change
    create_table :tweats do |t|
      t.text :tweat

      t.timestamps
    end
  end
end
