class CreateJoinTableEventInterests < ActiveRecord::Migration[5.1]
  def change
    create_join_table :events, :interests do |t|
      t.index [:event_id, :interest_id]
      t.index [:interest_id, :event_id]
    end
  end
end
