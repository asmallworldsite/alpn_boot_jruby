# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alpn_boot_jruby/version'

Gem::Specification.new do |spec|
  spec.name          = "alpn_boot_jruby"
  spec.version       = AlpnBootJruby::VERSION
  spec.authors       = ["Rory Sinclair"]
  spec.email         = ["rory@asmallworld.net"]
  spec.platform      = "java"

  spec.summary       = "A simple gem wrapper around Jetty's alpn-boot jar"
  spec.description   = "This gem allows JRuby apps to use Jetty's alpn-boot, automatically handling the per-JDK versioning."
  spec.homepage      = "https://github.com/asmallworldsite/alpn_boot_jruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://gem.asmallworld.net"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.requirements << "jar org.mortbay.jetty.alpn:alpn-boot, #{AlpnBootJruby::JAR_VERSION}"

  spec.add_dependency "jar-dependencies", '0.3.1'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
