class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :contributor_id, { null: false }
      t.integer :question_id, { null: false }
      t.text :body, { null: false }
      t.timestamps(null: false)
    end
  end
end
