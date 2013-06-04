Gem::Specification.new do |s|
  s.name         = 'foundation-helper'
  s.version      = '0.0.3'
  s.homepage     = 'https://github.com/gnovos/foundation-helper'
  s.summary      = 'Helper for building foundation 3 grids more cleanly, in ruby'
  s.description  = 'Helper for building foundation 3 grids more cleanly, in ruby'
  s.authors      = %w(Mason)
  s.email        = 'foundation.helper@chipped.net'
  s.files        = Dir["{lib}/**/*.rb", "bin/*", "*.md"]
  s.require_path = 'lib'
  s.bindir       = 'bin'

  s.add_dependency 'mobj'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'awesome_print'
end
