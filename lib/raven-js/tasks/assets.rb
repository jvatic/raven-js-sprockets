require 'raven-js/compiler'

namespace :assets do
  task :compile do
    RavenJS::Compiler.compile_assets
  end

  task :gzip do
    RavenJS::Compiler.gzip_assets
  end

  task :precompile => :gzip
end
