module XtPatch
  module Config
    class Patch
      @@default_config = {
        "name" => nil,
        "type" => "sequential",
        "paths" => [],
        "validator" => nil,
      }

      attr_accessor :name
      attr_accessor :type
      attr_accessor :paths
      attr_accessor :validator

      def initialize(name, type, paths, validator)
        @name = name ||= @@default_config["name"]
        @type = type ||= @@default_config["type"]
        @paths = paths ||= @@default_config["paths"]
        @validator = validator
      end

      def self.from_config(patch_config = @@default_config)
        paths = patch_config.class == String ? patch_config : patch_config&.[]("paths")
        paths = paths.class == String ? [paths] : paths

        return XtPatch::Config::Patch.new(
          patch_config["name"],
          patch_config["type"],
          paths,
          Validator.new(patch_config["validator"] || @@default_config["validator"]),
        )
      end

      def verify_patch()
        @paths.each { |path| `patch --dry-run "#{path}!"` }
      end
    end
  end
end
