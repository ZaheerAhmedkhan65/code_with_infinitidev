class AddRepositoryLinkAndPageLinkToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :repository_link, :string
    add_column :users, :page_link, :string
  end
end
