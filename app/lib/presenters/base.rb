module Presenters
  class Base
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def as_json(_options = {})
      object.as_json
    end

    alias call as_json

    def self.call(object)
      new(object).call
    end
  end
end
