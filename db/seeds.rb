# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#rails g migration CreateAnimes english_title:string japanese_title:string kanji_title:string synopsis:string avg_rating:string start_date:string end_date:string age_rating:string age_rating_guide:string poster_img_tiny:string poster_img_small:string poster_img_medium:string poster_img_large:string poster_img_original:string num_of_episodes:integer youtube_link:string nsfw:boolean

response = Faraday.get("https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=${offset}")
work_array = JSON.parse(response.body, symbolize_names: true)[:data]

item = work_array.first
check = work_array.map do |data|
  hash = {
    english_title:  data[:attributes][:titles][:en],
    japanese_title:  data[:attributes][:titles][:en_jp],
    kanji_title:  data[:attributes][:titles][:ja_jp],
    synopsis:  data[:attributes][:synopsis],
    avg_rating:  data[:attributes][:averageRating],
    start_date:  data[:attributes][:startDate],
    end_date:  data[:attributes][:endDate],
    age_rating:  data[:attributes][:ageRating],
    age_rating_guide:  data[:attributes][:ageRatingGuide],
    poster_img_tiny:  data[:attributes][:posterImage][:tiny],
    poster_img_small:  data[:attributes][:posterImage][:small],
    poster_img_medium:  data[:attributes][:posterImage][:medium],
    poster_img_large:  data[:attributes][:posterImage][:large],
    poster_img_original:  data[:attributes][:posterImage][:original],
    num_of_episodes:  data[:attributes][:episodeCount],
    youtube_link:  "https://www.youtube.com/watch?v=#{data[:attributes][:youtubeVideoId]}",
    nsfw:  data[:attributes][:nsfw]
  }
  Anime.create!(hash)
end
