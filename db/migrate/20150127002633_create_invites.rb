class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
    	t.references :attendee
    	t.references :attended_event

      t.timestamps
    end
  end
end
