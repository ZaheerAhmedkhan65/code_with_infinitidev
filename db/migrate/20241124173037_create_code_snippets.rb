class CreateCodeSnippets < ActiveRecord::Migration[7.2]
  def change
    create_table :code_snippets do |t|
      t.text :code

      t.timestamps
    end
  end
end
