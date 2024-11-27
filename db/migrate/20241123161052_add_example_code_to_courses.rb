class AddExampleCodeToCourses < ActiveRecord::Migration[7.2]
  def change
    add_column :courses, :example_code, :text
    add_column :courses, :code_language, :string
  end
end
