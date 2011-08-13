require 'active_support'
require 'json'
module JsonConfigAttributes
  extend ActiveSupport::Concern
  
  module ClassMethods
    def json_config_attributes(json, *attribute_names)
      attribute_names.each do |attribute_name|
    class_eval <<-RUBY
      def #{attribute_name}
        config_hash = JSON.parse #{json}
        config_hash['#{attribute_name}']
      rescue
        nil
      end
    RUBY
      end
    end
  end
end

