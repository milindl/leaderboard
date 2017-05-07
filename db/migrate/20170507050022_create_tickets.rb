class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :link
      t.references :user, foreign_key: true
      t.text :desc
      t.boolean :status
      t.string :typeof

      t.timestamps
    end
  end
end
