class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.belongs_to :subject, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
