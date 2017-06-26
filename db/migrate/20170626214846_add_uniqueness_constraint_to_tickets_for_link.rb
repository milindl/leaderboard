class AddUniquenessConstraintToTicketsForLink < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.change :link, :string, uniqueness: { scope: [:user, :status] }
    end
  end
end
