class AddCourseToCodeSnippets < ActiveRecord::Migration[7.2]
  def change
    add_reference :code_snippets, :course, foreign_key: true, null: true
  end
end
