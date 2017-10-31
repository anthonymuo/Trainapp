class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :started
      t.string :ended
      t.date :day

      t.timestamps
    end
  end
end
