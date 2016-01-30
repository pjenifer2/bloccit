#assignment 42
class Commenting < ActiveRecord::Base

    belongs_to :commentable, polymorphic: true
    belongs_to :topic

  end
