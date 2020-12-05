class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.string :InstructorName
      t.integer :InstructorCourse
      t.string :InstructorEmail
      t.string :StudentName
      t.string :Recommendation
      t.integer :grader_application_id

      t.timestamps
    end
  end
end
