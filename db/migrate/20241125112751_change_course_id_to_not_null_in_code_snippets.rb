class ChangeCourseIdToNotNullInCodeSnippets < ActiveRecord::Migration[7.2]
  def change
    change_column_null :code_snippets, :course_id, false
  end
end
