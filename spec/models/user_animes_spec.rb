require 'rails_helper'

describe UserAnime, type: :model do
  describe "relationships" do
    it {should belong_to :user_id}
    it {should belong_to :anime_id}
  end
end
