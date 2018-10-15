class CreateSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_table :speakers do |t|
      t.references :session, foreign_key: true
      t.string :name
      t.string :biography
      t.string :email
      t.string :speaker_agreement

      t.timestamps
    end
  end
end
