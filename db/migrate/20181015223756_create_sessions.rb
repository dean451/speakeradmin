class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :title
      t.string :description
      t.string :organizer
      t.string :about
      t.string :track
      t.string :source

      t.timestamps
    end
  end
end
