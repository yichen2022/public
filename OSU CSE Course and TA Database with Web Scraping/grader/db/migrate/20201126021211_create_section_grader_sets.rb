class CreateSectionGraderSets < ActiveRecord::Migration[6.0]
  def change
    create_table :section_grader_sets do |t|
      t.integer :course_section_id
      t.integer :CourseNumber
      t.string :Names

      t.timestamps
    end
  end
end
