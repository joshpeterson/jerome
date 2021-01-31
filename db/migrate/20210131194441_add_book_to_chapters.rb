class AddBookToChapters < ActiveRecord::Migration[6.1]
  def change
    add_reference :chapters, :book
  end
end
