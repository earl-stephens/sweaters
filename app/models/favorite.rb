class Favorite < ApplicationRecord

  belongs_to :user
  validates_presence_of :location

  def get_city_to_delete(location, user)
    Favorite.where(user_id: user.id).where(location: location)
  end

end
