class AddNameToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :name, :string
  end
end
