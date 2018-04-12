1.2.0
----------
- PR #2 - API deprecation fixes
  - Instagram API endpoints were yanked without warning
  - NOTE: this update only handles deprecated endpoints for `Users`
    - other endpoint deprecations remain TODO
  - BREAKING CHANGES: `Client::Users` methods removed for deprecated endpoints:
    - `user`
    - `user_search`
    - `user_follows`
    - `user_followed_by`
    - `user_requested_by`
    - `user_media_feed`
    - `user_recent_media`
    - `user_liked_media`
    - `user_relationship`
    - `follow_user`
    - `unfollow_user`
    - `block_user`
    - `unblock_user`
    - `approve_user`
    - `deny_user`
  - add/refactor `Client::Users` methods for 2 remaining API endpoints
    - `my_user` for "users/self" endpoint
    - `my_recent_media` for "users/self/media/recent" endpoint

1.1.7
----------
- PR #1 - fix oembed
- update `faraday` dependencies
