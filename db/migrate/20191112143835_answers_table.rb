class AnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
