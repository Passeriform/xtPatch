require_relative 'lib/xtPatch/version'

Gem::Specification.new do |spec|
  spec.name          = "xtPatch"
  spec.version       = XtPatch::VERSION
  spec.authors       = ["Passeriform"]
  spec.email         = ["utbh23041999@gmail.com"]

  spec.summary       = "Diff file monkey-patching framework"
  spec.description   = "A simplistic runner for managing run-time patches."
  spec.homepage      = "https://www.passeriform.com/prod/xtpatch"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Passeriform/xtPatch"
  spec.metadata["changelog_uri"] = "https://github.com/Passeriform/xtPatch/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
