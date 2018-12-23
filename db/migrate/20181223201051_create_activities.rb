class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :ip_addr

      t.timestamps
    end
  end
end
