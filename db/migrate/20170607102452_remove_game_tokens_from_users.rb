class RemoveGameTokensFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :game_tokens, :integer
  end
end
