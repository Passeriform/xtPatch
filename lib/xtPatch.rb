require "xtPatch/version"
require "xtPatch/config"
require "xtPatch/core"

module XtPatch
  def check_patch_files(patch_list_config)
    patch_list_config.map do |patch|
      patch.paths.each { |path| `git apply --check "#{path}!"` }
    end
  end

  class PatchBed
    # Create bed and prepare files for patching
    def prepare(bed_config, patch_config)
      @config = { "bed": config, "suites": patch_config }
      Dir.chdir(bed_config.src) do
        check_patch_files(patch_config.patches)
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
