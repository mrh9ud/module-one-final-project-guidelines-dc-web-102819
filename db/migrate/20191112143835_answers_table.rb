class AnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :body
      t.integer :question_id
      t.timestamps
    end
  end
end
