module Api
  module V1
    #:nodoc:
    class ApiController < ::ApplicationController
      include ::Authentication
    end
  end
end
