class AddUserToGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups, :contact, references: :users, index: true
  end
end
