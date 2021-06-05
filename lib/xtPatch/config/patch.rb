module XtPatch
  module Config
    class Patch
      @@default_config = {
        "name" => nil,
        "type" => "sequential",
        "paths" => [],
        "validator" => nil,
      }

      def initialize(name, type, paths, validator)
        @name = name ||= @@default_config["name"]
        @type = type ||= @@default_config["type"]
        @paths = paths ||= @@default_config["paths"]
        @validator = validator
      end

      def self.from_config(patch_config = @@default_config)
        paths = patch_config.class == String ? patch_config : patch_config&.[]("paths")

        return XtPatch::Config::Patch.new(
          patch_config["name"],
          patch_config["type"],
          paths,
          Validator.new(patch_config["validator"] || @@default_config["validator"]),
        )
      end
    end
  end
end
