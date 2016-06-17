require "thor"

class PadNYC < Thor

  desc "Validate", "Check that we know how to parse the intended file"
  def validate
    puts "validate"
  end

end
