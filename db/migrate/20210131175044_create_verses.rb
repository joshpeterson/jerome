class CreateVerses < ActiveRecord::Migration[6.1]
  def change
    create_table :verses do |t|
      t.string :text

      t.timestamps
    end
  end
end
