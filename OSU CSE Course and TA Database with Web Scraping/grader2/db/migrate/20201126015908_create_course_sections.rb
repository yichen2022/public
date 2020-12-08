class CreateCourseSections < ActiveRecord::Migration[6.0]
  def change
    create_table :course_sections do |t|
      t.string :Name
      t.integer :ClassNumber
      t.string :Component
      t.string :Location
      t.string :Times
      t.string :Instructor
      t.string :Session
      t.string :Topic

      t.timestamps
    end
  end
end
