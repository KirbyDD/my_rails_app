class CreateAnimes < ActiveRecord::Migration[5.1]
  def change
    create_table :animes do |t|
      t.string :english_title
      t.string :japanese_title
      t.string :kanji_title
      t.string :synopsis
      t.string :avg_rating
      t.string :start_date
      t.string :end_date
      t.string :age_rating
      t.string :age_rating_guide
      t.string :poster_img_tiny
      t.string :poster_img_small
      t.string :poster_img_medium
      t.string :poster_img_large
      t.string :poster_img_original
      t.integer :num_of_episodes
      t.string :youtube_link
      t.boolean :nsfw
    end
  end
end
