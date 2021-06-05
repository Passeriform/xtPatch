module XtPatch
  module Config
    class Suite
      attr_accessor :name
      attr_accessor :target
      attr_accessor :patches
      attr_accessor :final_validator

      def initialize(suite_name, suite_hash)
        @name = suite_name
        @target = File.expand_path(suite_hash["target"], Dir.pwd)
        @patches = suite_hash["patches"].map { |patch| Patch.from_config(patch) }
        @final_validator = XtPatch::Config::Validator.new(suite_hash["validator"])
        return self
      end

      def check_patch_files()
        @patches.map do |patch|
          patch.verify_patch()
        end
      end
    end
  end
end
