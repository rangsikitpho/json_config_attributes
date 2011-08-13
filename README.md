= json_config_attributes

Simple ActiveSupport::Concern for converting a JSON config string into
methods available for read.

## Install
  gem 'json_config_attributes'
  bundle

## Usage

```ruby
class Activity < ActiveRecord::Base
  include JsonConfigAttributes
  json_config_attributes :config_json,
    :name
end

# name is now available as an accessor
a = Activity.new(:config_json => '{ "name" : "activity name" }'
a.config_json
=> "activity name"
````

## TODO
Add write support to update config json by modifying attributes directly.

Possibly memoize parsed JSON.

== Contributing to json_config_attributes
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2011 Joshua Rangsikitpho, SocialVibe. See LICENSE.txt for
further details.

