class CreateHelpRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :help_requests do |t|
      t.string :title
      t.text :message
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
