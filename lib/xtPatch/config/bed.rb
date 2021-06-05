module XtPatch
  module Config
    class Bed
      @@defalt_config = {
        "patches-src" => ".",
        "meta" => {
          "author" => "",
        },
      }

      attr_accessor :src
      attr_accessor :meta

      def initialize(bed_conf = @@default_config)
        @src = bed_conf["patches-src"]
        @meta = bed_conf["meta"] ||= @@default_config["meta"]
        return self
      end
    end
  end
end
