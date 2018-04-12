module Instagram
  class Client
    # Defines methods related to users
    module Users

      # Returns extended information of a given user
      #
      # @overload user(id=nil, options={})
      #   @param user [Integer] An Instagram user ID
      #   @return [Hashie::Mash] The requested user.
      #   @example Return extended information for @shayne
      #     Instagram.user(20)
      # @format :json
      # @authenticated false unless requesting it from a protected user
      #
      #   If getting this data of a protected user, you must authenticate (and be allowed to see that user).
      # @rate_limited true
      # @see http://instagram.com/developer/endpoints/users/#get_users
      def user(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        id = args.first || 'self'
        response = get("users/#{id}", options)
        response
      end

      # Returns users that match the given query
      #
      # @format :json
      # @authenticated false
      # @rate_limited true
      # @param query [String] The search query to run against user search.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :count The number of users to retrieve.
      # @return [Hashie::Mash]
      # @see http://instagram.com/developer/endpoints/users/#get_users_search
      # @example Return users that match "Shayne Sweeney"
      #   Instagram.user_search("Shayne Sweeney")
      def user_search(query, options={})
        response = get('users/search', options.merge(:q => query))
        response
      end

      # Returns a list of users whom a given user follows
      #
      # @overload user_follows(id=nil, options={})
      #   @param options [Hash] A customizable set of options.
      #   @return [Hashie::Mash]
      #   @example Returns a list of users the authenticated user follows
      #     Instagram.user_follows
      # @overload user_follows(id=nil, options={})
      #   @param user [Integer] An Instagram user ID.
      #   @param options [Hash] A customizable set of options.
      #   @option options [Integer] :cursor (nil) Breaks the results into pages. Provide values as returned in the response objects's next_cursor attribute to page forward in the list.
      #   @option options [Integer] :count (nil) Limits the number of results returned per page.
      #   @return [Hashie::Mash]
      #   @example Return a list of users @mikeyk follows
      #     Instagram.user_follows(4) # @mikeyk user ID being 4
      # @see http://instagram.com/developer/endpoints/relationships/#get_users_follows
      # @format :json
      # @authenticated false unless requesting it from a protected user
      #
      #   If getting this data of a protected user, you must authenticate (and be allowed to see that user).
      # @rate_limited true
      def user_follows(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        id = args.first || "self"
        response = get("users/#{id}/follows", options)
        response
      end
    end


    end
  end
end
