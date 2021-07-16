class AddAuthorColumnToOpinion < ActiveRecord::Migration[6.1]
  def change
    add_column :opinions, :author_id, :integer, null: :false
  end
end
