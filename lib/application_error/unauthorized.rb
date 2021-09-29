module ApplicationError
  class Unauthorized < StandardError
    def message
      'Unauthorized'
    end
  end
end
