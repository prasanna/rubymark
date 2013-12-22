Gem::Specification.new do |s|
  s.name        = 'rubymark'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "RubyMark is an experimental Markdown parser!"
  s.description = "Trying to parse Markdown in a very simple and unit-testable way. Don't know if I can cover all of Markdown yet."
  s.authors     = ["Prasanna Pendse"]
  s.email       = 'ppendse@thoughtworks.com'
  s.files       = Dir[
                    "lib/**/*.rb",
                    "spec/**/*.rb",
                    "LICENSE.txt"
                  ]
  s.require_path = 'lib'
  s.bindir = 'bin'
  s.executables = ['rubymark']
  
  s.homepage    = 'https://github.com/prasanna/rubymark'
  
  s.cert_chain  = ['certs/prasanna.pem']
  s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
end