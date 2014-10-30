module Sluggable

  extend ActiveSupport::Concern

  included do
    after_validation :create_slug
    validates :slug, uniqueness: true
    class_attribute :slug_based_on
  end

  def to_param
    self.slug
  end

  def create_slug
  self.slug = self.send(self.class.slug_based_on.to_sym)
    # self.slug = self.title.parameterize
  end

  module ClassMethods
    def slug_field(slug_field_in)
     self.slug_based_on = slug_field_in
    end
  end

end