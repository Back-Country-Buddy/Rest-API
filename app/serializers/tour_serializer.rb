class TourSerializer
  include JSONAPI::Serializer
  attributes :date, :location, :creator_id, :complete
end
