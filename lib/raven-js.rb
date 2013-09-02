require "raven-js/version"

module RavenJS
  def self.settings
    @settings ||= {}
  end

  def self.configure(options = {})
    self.settings[:public_dir] ||= File.expand_path('../../public/assets', __FILE__) # lib/../public/assets
    unless self.settings[:asset_paths]
      self.settings[:asset_paths] = [ File.expand_path('../../src', __FILE__) ]
    end
    self.settings[:asset_paths] << File.expand_path('../../vendor', __FILE__) if options[:vendor]
    self.settings[:asset_paths].uniq!
  end

  module Sprockets
    # Append asset paths to an existing Sprockets environment
    def self.setup(environment, options = {})
      RavenJS.configure(options)
      RavenJS.settings[:asset_paths].each do |path|
        environment.append_path(path)
      end
    end

    module Helpers
      AssetNotFoundError = Class.new(StandardError)
      def asset_path(source, options = {})
        asset = environment.find_asset(source)
        raise AssetNotFoundError.new("#{source.inspect} does not exist within #{environment.paths.inspect}!") unless asset
        "./#{asset.digest_path}"
      end
    end
  end
end
