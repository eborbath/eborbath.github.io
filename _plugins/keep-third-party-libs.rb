# Keeps self-hosted third-party libraries (assets/libs, downloaded when
# third_party_libraries.download is true) byte-identical to the originals.
# jekyll-terser re-minifies every non-".min.js" file, which breaks the
# Subresource Integrity hashes in _config.yml and stops e.g. MathJax and the
# cookie consent banner from loading. This generator runs after jekyll-terser
# and swaps those files back to plain static files.
module Jekyll
  class KeepThirdPartyLibs < Generator
    safe true
    priority :lowest

    def generate(site)
      libs_dir = File.join(site.source, 'assets', 'libs')
      site.static_files.map! do |sf|
        next sf unless defined?(Jekyll::Terser::JSFile) && sf.is_a?(Jekyll::Terser::JSFile)
        next sf unless sf.path.start_with?(libs_dir + File::SEPARATOR)

        Jekyll::StaticFile.new(site, site.source, File.dirname(sf.relative_path), File.basename(sf.path))
      end
    end
  end
end
