class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :InstructorName
      t.string :StudentName
      t.integer :CourseNumber
      t.integer :Dedication
      t.integer :Performance
      t.integer :Cooperation
      t.integer :Initiative
      t.integer :Communication
      t.integer :Character
      t.integer :Responsiveness
      t.integer :Personality
      t.integer :Appearance
      t.integer :WorkHabit
      t.integer :grader_application_id

      t.timestamps
    end
  end
end
