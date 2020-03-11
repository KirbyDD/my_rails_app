class CreateUserAnimes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_animes do |t|
      t.references :user, foreign_key: true
      t.references :anime, foreign_key: true
      t.integer :current_episode, default: 1
      t.string :reminder, default: "No Reminder Set"
    end
  end
end
