module Interpark::Book
  class Requirement
    class << self
      def client
        Interpark::Book.client
      end
    end
  end
end
