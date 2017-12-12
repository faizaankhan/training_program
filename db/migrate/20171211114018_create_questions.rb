class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :question_paper_id
      t.text :question_description
      t.timestamps
    end
  end
end
