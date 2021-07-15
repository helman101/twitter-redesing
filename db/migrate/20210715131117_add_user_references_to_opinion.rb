class AddUserReferencesToOpinion < ActiveRecord::Migration[6.1]
  def change
    add_reference :opinions, :author, references: :user, foreign_key: true
  end
end
