module Instagram
  class Client
    # Defines methods related to users
    module Users

      # Returns extended information of the owner of the access token
      #
      # @overload user
      #   @return [Hashie::Mash] The requested user.
      # @format :json
      # @authenticated true
      # @rate_limited true
      # @see http://instagram.com/developer/endpoints/users/#users_self
      def my_user(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        response = get("users/self", options)
        response
      end

      # Returns recent media of the owner of the access token
      #
      # @overload my_recent_media(options={})
      #   @param options [Hash] A customizable set of options.
      #   @option options [Integer] :max_id Returns results with an ID less than (that is, older than) or equal to the specified ID.
      #   @option options [Integer] :min_id Return media later than this min_id
      #   @option options [Integer] :count Specifies the number of records to retrieve, per page.
      #   @return [Hashie::Mash]
      # @format :json
      # @authenticated true
      # @rate_limited true
      # @see http://instagram.com/developer/endpoints/users/#users_self_media_recent
      def my_recent_media(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        response = get("users/self/media/recent", options)
        response
      end
    end
  end
end
