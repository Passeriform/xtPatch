module XtPatch
  module Config
    class Suite
      def initialize(suite_name, suite_hash)
        @name = suite_name
        @target = File.expand_path(suite_hash["target"], Dir.pwd)
        @patches = suite_hash["patches"].map { |patch| Patch.from_config(patch) }
        @final_valdator = XtPatch::Config::Validator.new(suite_hash["validator"])
        return self
      end
    end
  end
end
