class AddReplyToHelpRequests < ActiveRecord::Migration[7.2]
  def change
    add_column :help_requests, :reply, :text
  end
end
