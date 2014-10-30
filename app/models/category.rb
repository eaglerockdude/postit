class Category < ActiveRecord::Base

  include Sluggable

  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true , uniqueness: true

  slug_field(:name)  #pass our slug field to module method


  # this code moved to Sluggable module
  # after_validation :create_slug
  # validates :slug, uniqueness: true

  # def to_param
  #   self.slug
  # end
  #
  # def create_slug
  #   self.slug = self.name.parameterize
  # end


end
