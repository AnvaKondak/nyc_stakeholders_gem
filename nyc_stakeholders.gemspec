
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nyc_stakeholders/version"

Gem::Specification.new do |spec|
  spec.name          = "nyc_stakeholders"
  spec.version       = NycStakeholders::VERSION
  spec.authors       = ["AnvaKondak"]
  spec.email         = ["anvakondak@gmail.com"]

  spec.summary       = %q{Ruby gem wrapper for NYC stakeholders.}
  spec.description   = %q{Processes NYC JSON data and returns stakeholder objects with properties job role and gender. }
  spec.homepage      = "https://github.com/AnvaKondak/nyc_stakeholders_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  # Specify which files should be added to the ge m when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "unirest", "1.1.2"
end
