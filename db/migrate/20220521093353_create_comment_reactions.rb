class CreateCommentReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_reactions do |t|
      t.integer :comment_id
      t.integer :reaction_id
      t.integer :reaction_count

      t.timestamps
    end
  end
end
