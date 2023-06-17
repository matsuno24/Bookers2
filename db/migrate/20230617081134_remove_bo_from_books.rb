class RemoveBoFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :Bo, :string
  end
end
