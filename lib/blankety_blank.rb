require "blankety_blank/version"
require "active_support/concern"

module BlanketyBlank
  extend ActiveSupport::Concern

  included do
    before_validation :nilify_attributes
  end

  private

  def nilify_attributes
    self.class.nilifiable_attributes.each do |attr|
      send("#{attr}=", nil) if send(attr).blank?
    end
  end

  # Declares which optional (non-presence validated) attributes should be nilified if blank
  #
  # @note When dealing with STI, declare `nilify_before_validation` on base class.
  #
  # @example
  #   class Company <  ActiveRecord::Base
  #     include BlanketyBlank
  #     nilify_before_validation :name, :phone
  #  end
  #
  module ClassMethods
    def nilify_before_validation(*attrs)
      @_class_nilifiable_attributes = attrs
    end

    def nilifiable_attributes
      @nilifiable_attributes ||= Array.wrap(
        descends_from_active_record? ? @_class_nilifiable_attributes : base_class.nilifiable_attributes
      )
    end
  end
end
