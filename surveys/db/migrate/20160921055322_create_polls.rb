class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls, comment: "Polls..." do |t|
      t.string :title,       null: false, comment: "Poll Title"
      t.text   :description, null: true,  comment: "Poll Description"
      t.jsonb  :options,     null: false, comment: "Poll Options"
      t.timestamps
    end
  end
end
