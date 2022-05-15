module RuSender
  # Class for interaction with lists
  class List < OpenStruct
    class << self
      extend Forwardable

      def_delegators :RuSender, :client

      # Gets all lists
      def get_all(params: {})
        response = client.get(path, params).parsed_body
        Collection.new(response, self)
      end

      # Creates a new list
      def create(title:)
        params = { title: title }
        response = client.post(path, params).parsed_body
        new(response)
      end

      # Gets a list by id
      def get(id:)
        response = client.get(path(id)).parsed_body
        new(response)
      end

      private

      def path(*args)
        ['lists', args].flatten.join('/')
      end
    end
  end
end
