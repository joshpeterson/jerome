class AddChapterToVerses < ActiveRecord::Migration[6.1]
  def change
    add_reference :verses, :chapter
  end
end
