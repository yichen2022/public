class CreateGraderApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :grader_applications do |t|
      t.string :Name
      t.string :Email
      t.string :GPA
      t.string :InterestedCourses
      t.string :AvailableTimes
      t.integer :course_section_id

      t.timestamps
    end
  end
end
