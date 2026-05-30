# frozen_string_literal: true

module ImagemagickAvailability
  class Guard < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      config = site.config["imagemagick"]
      return unless config.is_a?(Hash) && config["enabled"]
      return if command_available?("convert")

      config["enabled"] = false
      Jekyll.logger.info("Imagemagick:", "Disabled because `convert` is not available on PATH")
    end

    private

    def command_available?(command)
      ENV.fetch("PATH", "").split(File::PATH_SEPARATOR).any? do |dir|
        path = File.join(dir, command)
        File.file?(path) && File.executable?(path)
      end
    end
  end
end
