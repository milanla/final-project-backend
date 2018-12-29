class CreateSlangs < ActiveRecord::Migration[5.2]
  def change
    create_table :slangs do |t|
      t.references :user, foreign_key: true
      t.string :term
      t.string :definition
      t.string :example

      t.timestamps
    end
  end
end
