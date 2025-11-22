class CreateDiagnoses < ActiveRecord::Migration[7.2]
  def change
    create_table :diagnoses do |t|
      t.string :result
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
