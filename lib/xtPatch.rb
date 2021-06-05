require "xtPatch/version"
require "xtPatch/config"
require "xtPatch/core"

module XtPatch
    class Xt
    # Create bed and prepare files for patching
    def prepare(bed_config, suites)
      @config = { "bed": bed_config, "suites": suites }

      Dir.chdir(File.expand_path(Dir.pwd, bed_config.src)) do
        suites.map do |suite|
          suite.check_patch_files()
        end
      end
    end

    # Begin patching and run configured evaluators
    def start()
    end

    # Works like debug step. Iterates over each patch
    def step()
    end
  end

  class Error < StandardError; end
end
