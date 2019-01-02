class CreateLikedSlangs < ActiveRecord::Migration[5.2]
  def change
    create_table :liked_slangs do |t|
      t.string :author
      t.string :term
      t.string :definition
      t.string :example

      t.timestamps
    end
  end
end
