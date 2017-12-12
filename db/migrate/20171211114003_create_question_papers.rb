class CreateQuestionPapers < ActiveRecord::Migration[5.1]
  def change
    create_table :question_papers do |t|
      t.integer :exam_id
      t.timestamps
    end
  end
end
