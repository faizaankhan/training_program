class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :exam_id, null: false
      t.text :question_description
      t.timestamps
    end
  end
end
