module OldVoteable

  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

    def total_votes
      up_votes - down_votes
    end

    def up_votes
      self.votes.where(vote:true).size
    end

    def down_votes
      self.votes.where(vote:false).size
    end
end


# Classic metaprogramming
# module Voteable
#
#    # This method allows instance methods to be instance methods, and class methods to be class methods
#   def self.included(base)
#     base.send(:include, InstanceMethods)
#     base.extend(ClassMethods)
#
#     base.class_eval do
#       polymorphic_association
#     end
#   end
#
#   module InstanceMethods
#
#     def total_votes
#       up_votes - down_votes
#     end
#
#     def up_votes
#       self.votes.where(vote:true).size
#     end
#
#     def down_votes
#       self.votes.where(vote:false).size
#     end
#   end
#
#
#   module ClassMethods
#
#     def polymorphic_association
#       has_many :votes, as: :voteable
#     end
#
#   end
#
# end