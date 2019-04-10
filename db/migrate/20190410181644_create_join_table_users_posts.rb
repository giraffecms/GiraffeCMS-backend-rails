class CreateJoinTableUsersPosts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :posts do |t|
      t.index [:author_id, :post_id]
      t.index [:post_id, :author_id]
    end
  end
end
