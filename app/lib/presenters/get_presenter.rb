module Presenters
  class GetPresenter
    include Mapping

    attr_reader :object, :presenter_key

    def initialize(object, presenter_key: nil)
      @object = object
      @presenter_key = presenter_key.nil? ? :default : presenter_key.to_sym
    end

    def call
      mapping_options = MAPPING.with_indifferent_access[object_class_name]
      return Presenters::Base if mapping_options.nil?

      MAPPING.with_indifferent_access[object_class_name][presenter_key].constantize
    end

    def object_class_name
      object.class.name
    end

    def self.call(object, presenter_key: nil)
      new(object, presenter_key: presenter_key).call
    end
  end
end
