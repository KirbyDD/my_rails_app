class UserAnime < ApplicationRecord
  belongs_to :anime
  belongs_to :user
end
