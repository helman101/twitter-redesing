class AddUserReferencesToOpinion < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :opinions, :users, column: :author_id
    add_index :opinions, :author_id
  end
end
