class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer "user_id"
      t.integer "exam_id"
      t.string "answersheet"
      t.integer "marks"
      t.string "results"
      t.text "comments"
      t.timestamps
    end
  end
end
