require "as_mongo/version"
require "mongo"

module AsMongo
  class Ttt
    def hi
      "hi"
    end
  end
end

module BSON
  class OrderedHash
    def to_s
      _id.to_s
    end

    def _id
      fetch("_id",nil)
    end

    def created_at
      localtime_or_original_data("created_at")
    end

    def updated_at
      localtime_or_original_data("updated_at")
    end

    def deleted_at
      localtime_or_original_data("deleted_at")
    end

    private
    def localtime_or_original_data(at)
      utc_time = fetch(at,nil)
      (utc_time.class == Time) ? utc_time.localtime : utc_time
    end
  end
end
