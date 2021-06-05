module XtPatch
  module Config
    class Validator
      @@default_validator = {
        "exec" => ":",
      }

      def initialize(validator_hash = @@default_validator)
        @exec = validator_hash.class == String ? validator_hash : (validator_hash&.[]("exec") || @@default_validator["exec"])
      end
    end
  end
end
