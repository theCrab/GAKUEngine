class CreateGakuCourses < ActiveRecord::Migration
  def change
    create_table :gaku_courses do |t|
      t.string   :name
      t.string   :code

      t.references :faculty
      t.references :syllabus
      t.references :class_group

      t.timestamps
    end
  end
end
