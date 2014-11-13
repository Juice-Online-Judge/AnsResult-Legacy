class CreateLessonExercises < ActiveRecord::Migration
  def change
    create_table :lesson_exercise do |t|
      t.integer :lesson_unit
      t.string :exercise_title
      t.string :exercise_content
      t.integer :exercise_answer
      t.integer :exercise_tle
      t.integer :exercise_mle
      t.integer :exercise_fle
      t.integer :exercise_judge_mode
      t.integer :exercise_judge_added
      t.integer :exercise_is_visible
      t.integer :exercise_is_delete

      t.timestamps
    end
  end
end
