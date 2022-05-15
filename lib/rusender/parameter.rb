module RuSender
  # Class for interaction with list parameters
  class Parameter < OpenStruct
    class << self
      extend Forwardable

      def_delegators :RuSender, :client

      # Gets all parameters for a list
      def get_all(list_id:, params: {})
        response = client.get(path(list_id), params).parsed_body
        Collection.new(response, self)
      end

      # Creates a new parameter for a list
      def create(title:, kind:, list_id:)
        params = { title: title, kind: kind }
        response = client.post(path(list_id), params).parsed_body
        new(response)
      end

      private

      def path(list_id, *args)
        ['lists', list_id, 'parameters', args].flatten.join('/')
      end
    end
  end
end
