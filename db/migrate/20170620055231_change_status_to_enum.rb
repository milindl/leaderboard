class ChangeStatusToEnum < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.change :status, :integer, default: 0, null: false
    end
  end
end
