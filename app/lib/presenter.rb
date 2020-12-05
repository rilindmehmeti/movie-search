class Presenter
  attr_reader :object_or_collection, :presenter

  def initialize(object_or_collection, presenter: nil)
    @object_or_collection = object_or_collection
    @presenter = presenter
  end

  def call
    if object_or_collection.respond_to?(:map)
      present_collection(object_or_collection)
    else
      present_single_object(object_or_collection)
    end
  end

  def self.call(object_or_collection, presenter: nil)
    new(object_or_collection, presenter: presenter).call
  end

  private

  def present_single_object(object)
    Presenters::GetPresenter.call(object, presenter_key: presenter).new(object)
  end

  def present_collection(collection)
    collection.map { |object| present_single_object(object) }
  end
end
