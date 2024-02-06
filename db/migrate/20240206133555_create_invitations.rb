class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :event_invited, null: false, foreign_key: { to_table: :events }
      t.references :invited_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
