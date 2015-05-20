module Storytime
  class Navigation < ActiveRecord::Base
    include Storytime::ScopedToSite

    belongs_to :site
    has_many :links, foreign_key: :storytime_navigation_id, dependent: :destroy

    validates_presence_of :name, :handle

    before_validation :set_handle, on: :create

  private
    def set_handle
      self.handle = self.handle.present? ? self.handle.parameterize : self.name.parameterize
    end
  end
end