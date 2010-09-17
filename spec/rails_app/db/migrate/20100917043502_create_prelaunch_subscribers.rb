class CreatePrelaunchSubscribers < ActiveRecord::Migration
  def self.up
    create_table(:prelaunch_subscribers) do |t|
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :prelaunch_subscribers
  end
end
