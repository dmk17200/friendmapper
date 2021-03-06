class Friend < ActiveRecord::Base
  attr_accessible :facebook_id, :location, :name, :user_id

  # Associations
  belongs_to :user

  # Validations
  validates :user, presence: true
  validates :location, presence: true
  validates :facebook_id, uniqueness: { scope: :user_id }

  acts_as_gmappable

  def gmaps4rails_address
    self.location
  end

  def gmaps4rails_infowindow
    return "<img src='https://graph.facebook.com/#{self.facebook_id}/picture'> #{self.name}"
  end
end









