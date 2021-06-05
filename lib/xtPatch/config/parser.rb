require "toml-rb"

module XtPatch
  module Config
    class Parser
      @@reserved_tables = ["xtBed"]

      def self.parse(file_path)
        config_hash = TomlRB.load_file(file_path)

        bed_config = Bed.new(config_hash["xtBed"])
        patch_suites = parse_suites(config_hash)

        return bed_config, patch_suites
      end

      def self.parse_suites(config_hash)
        (config_hash.keys - @@reserved_tables).map do |suite_name|
          XtPatch::Config::Suite.new(suite_name, config_hash[suite_name])
        end
      end
    end
  end
end
