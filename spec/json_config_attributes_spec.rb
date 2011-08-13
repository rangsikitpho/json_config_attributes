require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "JsonConfigAttributes" do
  before(:each) do
    class Activity
      include JsonConfigAttributes
      attr_accessor :config_json
      #'{ "name" : "awesome activity" }'
      def initialize(config_json='')
        self.config_json = config_json
      end
    end
  end

  after(:each) do
    Object.send(:remove_const, :Activity)
  end

  it "makes the json_config_attributes method available" do
    Activity.should respond_to :json_config_attributes
  end

  it "should return the json value properly" do
    class Activity
      json_config_attributes :config_json, :name
    end

    a = Activity.new('{ "name" : "awesome activity" }')

    a.name.should == "awesome activity"
  end

  it "should return nil for a json attribute that isn't referenced in the config" do
    class Activity
      json_config_attributes :config_json, :unknown
    end

    a = Activity.new
    a.unknown.should be_nil
  end

  it "should raise an error if an attribute name that isn't specified is used and not defined by the class" do
    class Activity
      json_config_attributes :config_json, :name
    end

    a = Activity.new
    lambda { a.unknown }.should raise_error(NoMethodError)
  end

end
