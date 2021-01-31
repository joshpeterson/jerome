class AddBibleToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :bible
  end
end
