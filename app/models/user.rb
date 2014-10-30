class User < ActiveRecord::Base

  include Sluggable

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password  validations: false

  validates :username , presence: true,  uniqueness: true
  validates :password , presence: true,  on: :create , length: {minimum: 5}

  slug_field(:username)  #pass our slug field to module method


  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end

  # All this moved to Sluggable module.
  # after_validation :create_slug
  # validates :slug, uniqueness: true , presence: true

  # def to_param
  #   self.slug
  # end
  #
  # def create_slug
  #   self.slug = self.username.parameterize
  # end

end
