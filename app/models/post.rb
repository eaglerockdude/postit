class Post < ActiveRecord::Base

  include Voteable
  include Sluggable

  belongs_to :creator, foreign_key: "user_id" , class_name: "User"
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 5} , uniqueness: true
  validates :url, presence: true , uniqueness: true
  validates :description, presence: true

  validates :url, :url => true    # gem for entry

  # validates :creator, presence: true

  slug_field(:title)  #pass our slug field to module method

 end