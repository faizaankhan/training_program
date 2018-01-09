class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer 'user_id', null: false
      t.integer 'exam_id', null: false
      t.string 'answersheet'
      t.float 'marks'
      t.string 'results'
      t.text 'comments'
      t.timestamps
    end
  end
end
